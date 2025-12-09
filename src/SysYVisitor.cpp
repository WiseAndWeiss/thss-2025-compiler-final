#include "SysYVisitor.h"
#include "Module.h"
#include "Type.h"
#include "Value.h"
#include <iostream>
#include <vector>

// compUnit : (decl | funcDef)*;
std::any SysYVisitor::visitCompUnit(SysYParser::CompUnitContext *ctx) {
    for (auto child : ctx->children) {
        child->accept(this);
    }
    return nullptr;
}

// decl : constDecl | varDecl;
std::any SysYVisitor::visitDecl(SysYParser::DeclContext *ctx) {
    if (ctx->constDecl()) {
        return visitConstDecl(ctx->constDecl());
    } else if (ctx->varDecl()) {
        return visitVarDecl(ctx->varDecl());
    } else {
        return nullptr;
    }
}

// constDecl : 'const' bType constDef (',' constDef)* ';';
std::any SysYVisitor::visitConstDecl(SysYParser::ConstDeclContext *ctx) {
    for (auto constDef : ctx->constDef()) {
        constDef->accept(this);
    }
    return nullptr;
}

// bType : 'int';
std::any SysYVisitor::visitBType(SysYParser::BTypeContext *ctx) {
    return ctx->getText();
}

// constDef : IDENT ('[' constExp ']' )* '=' constInitVal;
std::any SysYVisitor::visitConstDef(SysYParser::ConstDefContext *ctx) {
    std::string name = ctx->IDENT()->getText();
    
    if (!ctx->constExp().empty()) {
        // TODO: 处理数组定义
        // 1. 计算数组维度
        // 2. 分配数组空间
        // 3. 加入符号表
        // 4. 处理数组初始化
    } else {
        // 标量处理
        Value* alloca = builder->createAlloca(TypeFactory::getIntType(), name);
        symbolTable->addSymbol(name, TypeFactory::getIntType(), alloca, true, false);
        
        if (ctx->constInitVal()) {
            // TODO: 计算常量表达式的值 (evaluateConstExp)
            // 目前暂时简化处理，假设已经有了值
            // int val = evaluateConstExp(ctx->constInitVal()->constExp());
            // builder->createStore(builder->getInt32(val), alloca);
        } 
    }
    return nullptr;
}

// constInitVal : constExp | '{' (constInitVal (',' constInitVal)*)? '}';
std::any SysYVisitor::visitConstInitVal(SysYParser::ConstInitValContext *ctx) {
    if (ctx->constExp()) {
        return visitConstExp(ctx->constExp());
    } else {
        // TODO: 处理数组初始化列表 '{' ... '}'
        return nullptr;
    }
}

// varDecl : bType varDef (',' varDef)* ';';
std::any SysYVisitor::visitVarDecl(SysYParser::VarDeclContext *ctx) {
    for (auto varDef : ctx->varDef()) {
        varDef->accept(this);
    }
    return nullptr;
}

// varDef : IDENT ('[' constExp ']' )* ( '=' initVal )?;
std::any SysYVisitor::visitVarDef(SysYParser::VarDefContext *ctx) {
    std::string name = ctx->IDENT()->getText();
    
    if (!ctx->constExp().empty()) {
        // TODO: 处理数组定义
        // 1. 计算数组维度
        // 2. 分配数组空间
        // 3. 加入符号表
        // 4. 处理数组初始化
    } else {
        // 1. 在栈上分配空间
        Value* alloca = builder->createAlloca(TypeFactory::getIntType(), name);
        
        // 2. 将变量加入符号表
        symbolTable->addSymbol(name, TypeFactory::getIntType(), alloca, false, false);
        
        // 3. 处理初始化
        if (ctx->ASSIGN()) {
            Value* initVal = std::any_cast<Value*>(visitInitVal(ctx->initVal()));
            builder->createStore(initVal, alloca);
        }
    }
    
    return nullptr;
}

// initVal : exp | '{' (initVal (',' initVal)*)? '}';
std::any SysYVisitor::visitInitVal(SysYParser::InitValContext *ctx) {
    if (ctx->exp()) {
        return visitExp(ctx->exp());
    } else {
        // TODO: 处理数组初始化列表 '{' ... '}'
        return nullptr;
    }
}

// funcDef : funcType IDENT '(' (funcFParams)? ')' block;
std::any SysYVisitor::visitFuncDef(SysYParser::FuncDefContext *ctx) {
    std::string funcName = ctx->IDENT()->getText();
    std::shared_ptr<Type> returnType = getTypeFromString(ctx->funcType()->getText());
    
    std::vector<std::shared_ptr<Type>> paramTypes;
    std::vector<std::string> paramNames;

    if (ctx->funcFParams()) {
        // 获取参数类型和名称
        auto params = std::any_cast<std::vector<std::pair<std::shared_ptr<Type>, std::string>>>(visitFuncFParams(ctx->funcFParams()));
        for (auto& param : params) {
            paramTypes.push_back(param.first);
            paramNames.push_back(param.second);
        }
    }
    
    auto funcType = TypeFactory::getFunctionType(returnType, paramTypes);
    Function* function = new Function(funcName, funcType);
    context->getModule()->addFunction(function);
    
    builder->setCurrentFunction(function);
    BasicBlock* entryBB = new BasicBlock("entry");
    function->addBasicBlock(entryBB);
    builder->setInsertPoint(entryBB);
    
    symbolTable->enterScope();
    
    // 处理参数声明：将参数添加到符号表
    auto args = function->getArguments();
    for (size_t i = 0; i < args.size(); ++i) {
        Value* arg = args[i];
        Value* alloca = builder->createAlloca(paramTypes[i], paramNames[i]);
        builder->createStore(arg, alloca);
        symbolTable->addSymbol(paramNames[i], paramTypes[i], alloca, false, false);
    }
    
    visitBlock(ctx->block());
    
    // 确保基本块有终结指令
    if (!builder->getCurrentBB()->isTerminated()) {
        if (returnType->toString() == "void") {
            builder->createRet(nullptr);
        } else if (funcName == "main" && returnType->toString() == "i32") {
            builder->createRet(builder->getInt32(0));
        } else {
            // TODO: 警告或错误，非void函数缺少return
            builder->createRet(builder->getInt32(0)); // 默认返回0
        }
    }
    
    symbolTable->leaveScope();
    return nullptr;
}

// funcType : 'void' | 'int';
std::any SysYVisitor::visitFuncType(SysYParser::FuncTypeContext *ctx) {
    return ctx->getText();
}

// funcFParams : funcFParam (',' funcFParam)*;
std::any SysYVisitor::visitFuncFParams(SysYParser::FuncFParamsContext *ctx) {
    std::vector<std::pair<std::shared_ptr<Type>, std::string>> params;
    for (auto paramCtx : ctx->funcFParam()) {
        params.push_back(std::any_cast<std::pair<std::shared_ptr<Type>, std::string>>(visitFuncFParam(paramCtx)));
    }
    return params;
}

// funcFParam : bType IDENT ('[' ']' )*;
std::any SysYVisitor::visitFuncFParam(SysYParser::FuncFParamContext *ctx) {
    std::string name = ctx->IDENT()->getText();
    std::shared_ptr<Type> type = getTypeFromString(ctx->bType()->getText());
    
    // TODO: 处理数组参数 (指针类型)
    // if (!ctx->L_BRACKT().empty()) { ... }
    
    return std::make_pair(type, name);
}

// block : '{' blockItem* '}';
std::any SysYVisitor::visitBlock(SysYParser::BlockContext *ctx) {
    // 块通常不开启新作用域，除非是函数体（已在funcDef处理）或显式块语句
    // 但SysY定义中block就是语句块，通常需要新作用域
    // 注意：funcDef中已经enterScope了，这里需要判断是否是函数体的block
    // 简单起见，可以在visitStmt中处理block的作用域，或者在这里统一处理
    // 如果父节点是FuncDef，则不需要enterScope（因为FuncDef已经做了）
    // 这里假设由调用者（visitStmt或visitFuncDef）管理作用域，或者在这里判断
    
    for (auto item : ctx->blockItem()) {
        item->accept(this);
    }
    return nullptr;
}

// blockItem : decl | stmt;
std::any SysYVisitor::visitBlockItem(SysYParser::BlockItemContext *ctx) {
    return visitChildren(ctx);
}

// stmt : lVal '=' exp ';'
//      | block
//      | 'if' '(' cond ')' stmt ( 'else' stmt )?
//      | 'while' '(' cond ')' stmt
//      | 'break' ';'
//      | 'continue' ';'
//      | 'return' ( exp )? ';';
std::any SysYVisitor::visitStmt(SysYParser::StmtContext *ctx) {
    if (ctx->ASSIGN()) {
        // lVal '=' exp ';'
        Value* lValAddr = std::any_cast<Value*>(visitLVal(ctx->lVal()));
        Value* expVal = std::any_cast<Value*>(visitExp(ctx->exp()));
        builder->createStore(expVal, lValAddr);
    } else if (ctx->block()) {
        symbolTable->enterScope();
        visitBlock(ctx->block());
        symbolTable->leaveScope();
    } else if (ctx->IF()) {
        // 'if' '(' cond ')' stmt ( 'else' stmt )?
        // TODO: 实现If控制流
        // 1. 创建 trueBB, falseBB, nextBB (如果有else)
        // 2. visitCond(ctx->cond()) -> 生成比较指令和跳转
        // 3. builder->setInsertPoint(trueBB); visitStmt(stmt1);
        // 4. 处理 else 分支
    } else if (ctx->WHILE()) {
        // 'while' '(' cond ')' stmt
        // TODO: 实现While控制流
        // 1. 创建 condBB, bodyBB, nextBB
        // 2. 跳转到 condBB
        // 3. 在 condBB 中生成条件判断
        // 4. 在 bodyBB 中生成循环体
        // 5. 处理 break/continue 栈
    } else if (ctx->BREAK()) {
        // TODO: 跳转到当前循环的 nextBB
    } else if (ctx->CONTINUE()) {
        // TODO: 跳转到当前循环的 condBB
    } else if (ctx->RETURN()) {
        Value* retVal = nullptr;
        if (ctx->exp()) {
            retVal = std::any_cast<Value*>(visitExp(ctx->exp()));
        }
        builder->createRet(retVal);
    } else if (ctx->exp()) {
        // exp ';'
        visitExp(ctx->exp());
    }
    return nullptr;
}

// exp : addExp;
std::any SysYVisitor::visitExp(SysYParser::ExpContext *ctx) {
    return ctx->addExp()->accept(this);
}

// cond : lOrExp;
std::any SysYVisitor::visitCond(SysYParser::CondContext *ctx) {
    return visitChildren(ctx);
}

// lVal : IDENT ('[' exp ']' )*;
std::any SysYVisitor::visitLVal(SysYParser::LValContext *ctx) {
    std::string name = ctx->IDENT()->getText();
    SymbolEntry* entry = symbolTable->lookup(name);
    
    if (!entry) {
        std::cerr << "Error: Undefined variable " << name << std::endl;
        return nullptr;
    }

    if (!ctx->exp().empty()) {
        // TODO: 处理数组访问 (GEP)
        // Value* ptr = entry->value;
        // for (auto exp : ctx->exp()) {
        //     Value* idx = visitExp(exp);
        //     ptr = builder->createGEP(ptr, idx);
        // }
        // return ptr;
        return nullptr; 
    }
    
    // 返回变量的地址 (AllocaInst 或 GlobalVariable)
    return entry->value;
}

// primaryExp : lVal | number | '(' exp ')';
std::any SysYVisitor::visitPrimaryExp(SysYParser::PrimaryExpContext *ctx) {
    if (ctx->lVal()) {
        // 获取地址并加载
        Value* addr = std::any_cast<Value*>(visitLVal(ctx->lVal()));
        if (addr) {
            return (Value*)builder->createLoad(addr);
        }
        return nullptr;
    } else if (ctx->number()) {
        return visitNumber(ctx->number());
    } else if (ctx->L_PAREN()) {
        return visitExp(ctx->exp());
    }
    return nullptr;
}

// number : INTEGER_CONST;
std::any SysYVisitor::visitNumber(SysYParser::NumberContext *ctx) {
    int val = 0;
    std::string text = ctx->INTEGER_CONST()->getText();
    try {
        val = std::stoi(text, nullptr, 0);
    } catch (...) {
        val = 0;
    }
    return (Value*)builder->getInt32(val);
}

// unaryExp : primaryExp | unaryOp unaryExp | IDENT '(' (funcRParams)? ')';
std::any SysYVisitor::visitUnaryExp(SysYParser::UnaryExpContext *ctx) {
    if (ctx->primaryExp()) {
        return visitPrimaryExp(ctx->primaryExp());
    } else if (ctx->unaryOp()) {
        std::string op = ctx->unaryOp()->getText();
        Value* val = std::any_cast<Value*>(visitUnaryExp(ctx->unaryExp()));
        
        if (op == "+") {
            return val;
        } else if (op == "-") {
            return builder->createSub(builder->getInt32(0), val);
        } else if (op == "!") {
            // TODO: 处理逻辑非 (icmp eq 0)
            // return builder->createICmpEQ(val, builder->getInt32(0));
        }
    } else if (ctx->IDENT()) {
        // 函数调用
        std::string funcName = ctx->IDENT()->getText();
        // TODO: 查找函数定义
        // Function* func = module->getFunction(funcName);
        
        std::vector<Value*> args;
        if (ctx->funcRParams()) {
            args = std::any_cast<std::vector<Value*>>(visitFuncRParams(ctx->funcRParams()));
        }
        
        // TODO: 创建Call指令
        // return builder->createCall(func, args);
    }
    return nullptr;
}

// unaryOp : '+' | '-' | '!';
std::any SysYVisitor::visitUnaryOp(SysYParser::UnaryOpContext *ctx) {
    return ctx->getText();
}

// funcRParams : exp (',' exp)*;
std::any SysYVisitor::visitFuncRParams(SysYParser::FuncRParamsContext *ctx) {
    std::vector<Value*> args;
    for (auto exp : ctx->exp()) {
        args.push_back(std::any_cast<Value*>(visitExp(exp)));
    }
    return args;
}

// mulExp : unaryExp | mulExp ('*' | '/' | '%') unaryExp;
std::any SysYVisitor::visitMulExp(SysYParser::MulExpContext *ctx) {
    if (ctx->mulExp()) {
        Value* lhs = std::any_cast<Value*>(visitMulExp(ctx->mulExp()));
        Value* rhs = std::any_cast<Value*>(visitUnaryExp(ctx->unaryExp()));
        
        if (ctx->MUL()) {
            return builder->createMul(lhs, rhs);
        } else if (ctx->DIV()) {
            return builder->createSDiv(lhs, rhs);
        } else if (ctx->MOD()) {
            return builder->createSRem(lhs, rhs);
        }
    }
    return visitUnaryExp(ctx->unaryExp());
}

// addExp : mulExp | addExp ('+' | '-') mulExp;
std::any SysYVisitor::visitAddExp(SysYParser::AddExpContext *ctx) {
    if (ctx->addExp()) {
        Value* lhs = std::any_cast<Value*>(visitAddExp(ctx->addExp()));
        Value* rhs = std::any_cast<Value*>(visitMulExp(ctx->mulExp()));
        
        if (ctx->PLUS()) {
            return builder->createAdd(lhs, rhs);
        } else if (ctx->MINUS()) {
            return builder->createSub(lhs, rhs);
        }
    }
    return visitMulExp(ctx->mulExp());
}

// relExp : addExp | relExp ('<' | '>' | '<=' | '>=') addExp;
std::any SysYVisitor::visitRelExp(SysYParser::RelExpContext *ctx) {
    if (ctx->relExp()) {
        Value* lhs = std::any_cast<Value*>(visitRelExp(ctx->relExp()));
        Value* rhs = std::any_cast<Value*>(visitAddExp(ctx->addExp()));
        
        // TODO: 返回 i1 类型 (boolean)
        if (ctx->LT()) {
            // return builder->createICmpSLT(lhs, rhs);
        } else if (ctx->GT()) {
            // return builder->createICmpSGT(lhs, rhs);
        } 
        // ... 其他比较符
    }
    return visitAddExp(ctx->addExp());
}

// eqExp : relExp | eqExp ('==' | '!=') relExp;
std::any SysYVisitor::visitEqExp(SysYParser::EqExpContext *ctx) {
    if (ctx->eqExp()) {
        Value* lhs = std::any_cast<Value*>(visitEqExp(ctx->eqExp()));
        Value* rhs = std::any_cast<Value*>(visitRelExp(ctx->relExp()));
        
        // TODO: 返回 i1 类型
        if (ctx->EQ()) {
            // return builder->createICmpEQ(lhs, rhs);
        } else if (ctx->NEQ()) {
            // return builder->createICmpNE(lhs, rhs);
        }
    }
    return visitRelExp(ctx->relExp());
}

// lAndExp : eqExp | lAndExp '&&' eqExp;
std::any SysYVisitor::visitLAndExp(SysYParser::LAndExpContext *ctx) {
    if (ctx->lAndExp()) {
        // TODO: 实现短路求值
        // 1. visitLAndExp(lhs)
        // 2. 创建 trueBB (rhs block), falseBB (merge block)
        // 3. condBr(lhs, trueBB, falseBB)
        // 4. setInsertPoint(trueBB)
        // 5. visitEqExp(rhs)
        // 6. phi node merge result
    }
    return visitEqExp(ctx->eqExp());
}

// lOrExp : lAndExp | lOrExp '||' lAndExp;
std::any SysYVisitor::visitLOrExp(SysYParser::LOrExpContext *ctx) {
    if (ctx->lOrExp()) {
        // TODO: 实现短路求值
    }
    return visitLAndExp(ctx->lAndExp());
}

// constExp : addExp;
std::any SysYVisitor::visitConstExp(SysYParser::ConstExpContext *ctx) {
    return visitChildren(ctx);
}

std::shared_ptr<Type> SysYVisitor::getTypeFromString(const std::string& typeStr) {
    if (typeStr == "int") return TypeFactory::getIntType();
    if (typeStr == "void") return TypeFactory::getVoidType();
    return TypeFactory::getIntType();
}

int SysYVisitor::evaluateConstExp(SysYParser::ConstExpContext *ctx) { 
    return 0;
}
