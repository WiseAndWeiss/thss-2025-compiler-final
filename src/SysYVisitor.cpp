#include "SysYVisitor.h"
#include "Module.h"
#include "Type.h"
#include "Value.h"
#include <iostream>
#include <vector>
#include <numeric>
#include <functional>

#define DEBUG_LOCATION_INFO 1;//std::cerr<<"[Debug] Enter "<<__func__<<std::endl;

// compUnit : (decl | funcDef)*;
std::any SysYVisitor::visitCompUnit(SysYParser::CompUnitContext *ctx) {
    DEBUG_LOCATION_INFO
    // 初始化外部库函数
    initializeExternalFunctions();
    
    for (auto child : ctx->children) {
        child->accept(this);
    }
    return nullptr;
}

// decl : constDecl | varDecl;
std::any SysYVisitor::visitDecl(SysYParser::DeclContext *ctx) {
    DEBUG_LOCATION_INFO
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
    DEBUG_LOCATION_INFO
    for (auto constDef : ctx->constDef()) {
        constDef->accept(this);
    }
    return nullptr;
}

// bType : INT;
std::any SysYVisitor::visitBType(SysYParser::BTypeContext *ctx) {
    DEBUG_LOCATION_INFO
    // bType 只是类型标记，不需要生成代码
    return nullptr;
}

// constDef : IDENT ('[' constExp ']' )* '=' constInitVal;
std::any SysYVisitor::visitConstDef(SysYParser::ConstDefContext *ctx) {
    DEBUG_LOCATION_INFO
    std::string name = ctx->IDENT()->getText();
    bool isGlobal = (builder->getCurrentFunction() == nullptr);
    
    if (!ctx->constExp().empty()) {
        // 处理数组定义
        // 1. 计算数组维度
        std::vector<uint64_t> dimensions;
        for (auto constExpCtx : ctx->constExp()) {
            int dim = evaluateConstExp(constExpCtx);
            dimensions.push_back(dim);
        }
        
        // 2. 创建数组类型（从内到外）
        std::shared_ptr<Type> elementType = TypeFactory::getIntType();
        for (auto it = dimensions.rbegin(); it != dimensions.rend(); ++it) {
            elementType = TypeFactory::getArrayType(elementType, *it);
        }
        
        // 3. 分配数组空间
        if (isGlobal) {
            // 全局常量数组
            Value* initValue = nullptr;
            if (ctx->constInitVal()) {
                std::string initStr = generateGlobalArrayInitializer(ctx->constInitVal(), dimensions);
                // 创建一个特殊的 Value 来存储初始化器字符串
                initValue = new Value(initStr, elementType);
            }
            Value* gvar = builder->createGlobalVariable(name, elementType, initValue, true);
            auto ptrType = TypeFactory::getPointerType(elementType);
            symbolTable->addSymbol(name, ptrType, gvar, true, true, 0);
        } else {
            // 局部数组
            Value* alloca = builder->createAlloca(elementType, name);
            auto ptrType = TypeFactory::getPointerType(elementType);
            symbolTable->addSymbol(name, ptrType, alloca, true, false, 0);
            
            // 处理局部数组初始化
            if (ctx->constInitVal()) {
                int linearIndex = 0;
                initializeArrayConst(alloca, elementType, ctx->constInitVal(), dimensions, linearIndex);
            }
        }
    } else {
        // 标量常量处理
        int constVal = 0;
        if (ctx->constInitVal() && ctx->constInitVal()->constExp()) {
            constVal = evaluateConstExp(ctx->constInitVal()->constExp());
        }
        
        Value* initValue = builder->getInt32(constVal);
        
        if (isGlobal) {
            // 全局常量
            Value* gvar = builder->createGlobalVariable(name, TypeFactory::getIntType(), initValue, true);
            // 全局变量的类型是指针类型
            auto ptrType = TypeFactory::getPointerType(TypeFactory::getIntType());
            symbolTable->addSymbol(name, ptrType, gvar, true, true, constVal);
        } else {
            // 局部常量
            Value* alloca = builder->createAlloca(TypeFactory::getIntType(), name);
            // alloca 返回的是指针类型
            auto ptrType = TypeFactory::getPointerType(TypeFactory::getIntType());
            symbolTable->addSymbol(name, ptrType, alloca, true, false, constVal);
            builder->createStore(initValue, alloca);
        }
    }
    return nullptr;
}

// varDef : IDENT ('[' constExp ']' )* ( '=' initVal )?;
std::any SysYVisitor::visitVarDef(SysYParser::VarDefContext *ctx) {
    DEBUG_LOCATION_INFO
    std::string name = ctx->IDENT()->getText();
    std::cerr << "visitVarDef: " << (ctx->constExp().empty() ? "scalar " : "array ") << name << std::endl;
    bool isGlobal = (builder->getCurrentFunction() == nullptr);
    if (!ctx->constExp().empty()) {
        // 处理数组定义
        // 1. 计算数组维度
        std::vector<uint64_t> dimensions;
        for (auto constExpCtx : ctx->constExp()) {
            int dim = evaluateConstExp(constExpCtx);
            std::cerr << "dim: " << dim << std::endl;
            dimensions.push_back(dim);
        }
        
        // 2. 创建数组类型（从内到外）
        std::shared_ptr<Type> elementType = TypeFactory::getIntType();
        for (auto it = dimensions.rbegin(); it != dimensions.rend(); ++it) {
            elementType = TypeFactory::getArrayType(elementType, *it);
        }
        
        // 3. 分配数组空间
        if (isGlobal) {
            // 全局数组
            Value* initValue = nullptr;
            if (ctx->initVal()) {
                std::string initStr = generateGlobalArrayInitializer(ctx->initVal(), dimensions);
                initValue = new Value(initStr, elementType);
            }
            Value* gvar = builder->createGlobalVariable(name, elementType, initValue, false);
            auto ptrType = TypeFactory::getPointerType(elementType);
            symbolTable->addSymbol(name, ptrType, gvar, false, true, 0);
            std::cerr << "[DEBUG] Created global array: " << name << std::endl;
            
            // TODO: 处理全局数组初始化
            // std::string initStr = "zeroinitializer"; // 默认零初始化
            // // 如果有初始化列表，生成自定义初始化器
            // if (ctx->ASSIGN() && ctx->initVal() && ctx->initVal()->constInitVal()) {
            //     std::cerr << "[DEBUG] Generating global array initializer for: " << name << std::endl;
            //     initStr = generateGlobalArrayInitializer(ctx->initVal()->constInitVal(), dimensions);
            //     std::cerr << "[DEBUG] Global array initializer string: " << initStr << std::endl;
            // }

            // // 关键：创建全局变量时传递初始化器字符串（需适配IRBuilder的接口）
            // // 方式1：如果IRBuilder的createGlobalVariable支持直接传入初始化字符串（推荐）
            // Value* gvar = builder->createGlobalVariable(name, elementType, initStr, false);
            
            // // 方式2：如果IRBuilder仍用Value*传递（兼容原有接口），可封装为自定义结构体
            // // Value* initValue = new GlobalArrayInitValue(initStr); // 自定义Value子类
            // // Value* gvar = builder->createGlobalVariable(name, elementType, initValue, false);

            // auto ptrType = TypeFactory::getPointerType(elementType);
            // symbolTable->addSymbol(name, ptrType, gvar, false, true, 0);
        } else {
            // 局部数组
            Value* alloca = builder->createAlloca(elementType, name);
            auto ptrType = TypeFactory::getPointerType(elementType);
            symbolTable->addSymbol(name, ptrType, alloca, false, false, 0);
            
            // 处理局部数组初始化
            if (ctx->ASSIGN() && ctx->initVal()) {
                // 先进行零初始化
                uint64_t totalElements = std::accumulate(dimensions.begin(), dimensions.end(), 1, std::multiplies<uint64_t>());
                
                // 获取指向第一个元素的指针 (i32*)
                // createGEP 自动添加第一个 0 索引，然后我们需要为每一维添加一个 0 索引
                std::vector<Value*> zeros;
                for (size_t i = 0; i < dimensions.size(); ++i) {
                    zeros.push_back(builder->getInt32(0));
                }
                Value* elemPtr = builder->createGEP(alloca, zeros);
                
                builder->createMemZero(elemPtr, totalElements);
                
                int linearIndex = 0;
                initializeArray(alloca, elementType, ctx->initVal(), dimensions, linearIndex);
            }
        }
    } else {
        // 标量变量处理
        if (isGlobal) {
            // 全局变量
            Value* initValue = nullptr;
            if (ctx->ASSIGN() && ctx->initVal()) {
                // 全局变量初始化必须是常量表达式
                if (ctx->initVal()->exp()) {
                    // 尝试评估 exp（如果它是常量表达式）
                    // 注意：这里假设 exp 是常量表达式，实际应该进行类型检查
                    try {
                        int constVal = evaluateExp(ctx->initVal()->exp());
                        initValue = builder->getInt32(constVal);
                    } catch (...) {
                        // 如果不是常量表达式，初始化为0
                        initValue = builder->getInt32(0);
                    }
                } else {
                    // 如果不是常量表达式，初始化为0
                    initValue = builder->getInt32(0);
                }
            } else {
                initValue = builder->getInt32(0);
            }
            
            Value* gvar = builder->createGlobalVariable(name, TypeFactory::getIntType(), initValue, false);
            // 全局变量的类型是指针类型
            auto ptrType = TypeFactory::getPointerType(TypeFactory::getIntType());
            symbolTable->addSymbol(name, ptrType, gvar, false, true, 0);
        } else {
            // 局部变量
            Value* alloca = builder->createAlloca(TypeFactory::getIntType(), name);
            // alloca 返回的是指针类型
            auto ptrType = TypeFactory::getPointerType(TypeFactory::getIntType());
            symbolTable->addSymbol(name, ptrType, alloca, false, false, 0);
            
            // 处理初始化
            if (ctx->ASSIGN() && ctx->initVal()) {
                Value* initVal = std::any_cast<Value*>(visitInitVal(ctx->initVal()));
                if (initVal) {
                    builder->createStore(initVal, alloca);
                }
            }
        }
    }
    
    return nullptr;
}

// initVal : exp | '{' (initVal (',' initVal)*)? '}';
std::any SysYVisitor::visitInitVal(SysYParser::InitValContext *ctx) {
    DEBUG_LOCATION_INFO
    if (ctx->exp()) {
        return visitExp(ctx->exp());
    } else {
        // 数组初始化列表在 initializeArray 中处理
        return nullptr;
    }
}

// constInitVal : constExp | '{' (constInitVal (',' constInitVal)*)? '}';
std::any SysYVisitor::visitConstInitVal(SysYParser::ConstInitValContext *ctx) {
    DEBUG_LOCATION_INFO
    if (ctx->constExp()) {
        // 标量常量表达式，在 visitConstDef 中处理
        return nullptr;
    } else {
        // 数组初始化列表在 initializeArrayConst 中处理
        return nullptr;
    }
}

// varDecl : bType varDef (',' varDef)* ';';
std::any SysYVisitor::visitVarDecl(SysYParser::VarDeclContext *ctx) {
    DEBUG_LOCATION_INFO
    for (auto varDef : ctx->varDef()) {
        varDef->accept(this);
    }
    return nullptr;
}

// funcDef : funcType IDENT '(' (funcFParams)? ')' block;
std::any SysYVisitor::visitFuncDef(SysYParser::FuncDefContext *ctx) {
    DEBUG_LOCATION_INFO
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
    
    // 将函数添加到符号表（全局作用域）
    symbolTable->addSymbol(funcName, funcType, function, false, true, 0);
    
    builder->setCurrentFunction(function);
    BasicBlock* entryBB = new BasicBlock("entry");
    function->addBasicBlock(entryBB);
    builder->setInsertPoint(entryBB);
    
    symbolTable->enterScope();
    
    // 创建函数参数并添加到函数参数列表
    auto& args = function->getArguments();
    for (size_t i = 0; i < paramTypes.size(); ++i) {
        // 创建参数 Value（参数名称为 paramNames[i]，类型为值类型，如 i32）
        // 在 LLVM IR 中，函数参数是值类型，不是指针类型
        Value* arg = new Value(paramNames[i], paramTypes[i]);
        args.push_back(arg);
        
        // 为参数分配栈空间（使用不同的名称避免与参数名冲突）
        // 在 LLVM IR 中，函数参数和局部变量不能同名
        std::string localVarName = paramNames[i] + "_local";
        Value* alloca = builder->createAlloca(paramTypes[i], localVarName);
        // 将参数值存储到局部变量中
        builder->createStore(arg, alloca);
        // alloca 返回的是指针类型，将其添加到符号表（使用参数名作为符号名）
        auto ptrType = TypeFactory::getPointerType(paramTypes[i]);
        symbolTable->addSymbol(paramNames[i], ptrType, alloca, false, false, 0);
    }
    
    visitBlock(ctx->block());
    
    // 确保基本块有终结指令
    BasicBlock* currentBB = builder->getCurrentBB();
    if (currentBB && !currentBB->isTerminated()) {
        if(returnType->toString() == "i32"){
            Value* zero = new Value("0", TypeFactory::getIntType());
            builder->createRet(zero);
        }
        else
            builder->createRet(nullptr);
    }
    
    symbolTable->leaveScope();
    builder->setCurrentFunction(nullptr);
    
    return nullptr;
}

// funcType : 'void' | 'int';
std::any SysYVisitor::visitFuncType(SysYParser::FuncTypeContext *ctx) {
    DEBUG_LOCATION_INFO
    return ctx->getText();
}

// funcFParams : funcFParam (',' funcFParam)*;
std::any SysYVisitor::visitFuncFParams(SysYParser::FuncFParamsContext *ctx) {
    DEBUG_LOCATION_INFO
    std::vector<std::pair<std::shared_ptr<Type>, std::string>> params;
    for (auto paramCtx : ctx->funcFParam()) {
        auto param = std::any_cast<std::pair<std::shared_ptr<Type>, std::string>>(visitFuncFParam(paramCtx));
        params.push_back(param);
    }
    return params;
}

// funcFParam : bType IDENT ('[' ']')*;
std::any SysYVisitor::visitFuncFParam(SysYParser::FuncFParamContext *ctx) {
    DEBUG_LOCATION_INFO
    std::shared_ptr<Type> baseType = getTypeFromString(ctx->bType()->getText());
    std::string paramName = ctx->IDENT()->getText();
    
    // 处理数组参数
    // SysY中数组参数第一维必须为空，如 int a[][5] 或 int a[]
    // 实际上是传递指针，如 int (*a)[5] 或 int *a
    
    // 获取所有维度表达式（从第二维开始）
    auto exps = ctx->exp();
    
    // 从内向外构建数组类型
    for (auto it = exps.rbegin(); it != exps.rend(); ++it) {
        int dim = evaluateExp(*it);
        baseType = TypeFactory::getArrayType(baseType, dim);
    }
    
    // 如果有方括号，最外层是指针（衰退的第一维）
    if (!ctx->L_BRACKT().empty()) {
        baseType = TypeFactory::getPointerType(baseType);
    }
    
    return std::make_pair(baseType, paramName);
}

// block : '{' blockItem* '}';
std::any SysYVisitor::visitBlock(SysYParser::BlockContext *ctx) {
    DEBUG_LOCATION_INFO
    symbolTable->enterScope();
    for (auto blockItem : ctx->blockItem()) {
        blockItem->accept(this);
    }
    symbolTable->leaveScope();
    return nullptr;
}

// blockItem : decl | stmt;
std::any SysYVisitor::visitBlockItem(SysYParser::BlockItemContext *ctx) {
    DEBUG_LOCATION_INFO
    if (ctx->decl()) {
        return visitDecl(ctx->decl());
    } else if (ctx->stmt()) {
        return visitStmt(ctx->stmt());
    }
    return nullptr;
}

// stmt : lVal '=' exp ';' | (exp)? ';' | block | 'if' '(' cond ')' stmt ('else' stmt)? | 'while' '(' cond ')' stmt | 'break' ';' | 'continue' ';' | 'return' (exp)? ';';
std::any SysYVisitor::visitStmt(SysYParser::StmtContext *ctx) {
    DEBUG_LOCATION_INFO
    if (ctx->ASSIGN() && ctx->lVal()) {
        // 赋值语句
        Value* lval = std::any_cast<Value*>(visitLVal(ctx->lVal()));
        Value* expVal = std::any_cast<Value*>(visitExp(ctx->exp()));
        builder->createStore(expVal, lval);
    } else if (ctx->block()) {
        visitBlock(ctx->block());
    } else if (ctx->IF()) {
        // 实现 if-else 语句
        Function* currentFunc = builder->getCurrentFunction();
        BasicBlock* currentBB = builder->getCurrentBB();
        
        // 创建基本块（使用唯一计数器生成名称）
        int currentIfId = ifCounter++;
        BasicBlock* thenBB = new BasicBlock("if_then_" + std::to_string(currentIfId));
        BasicBlock* elseBB = ctx->ELSE() ? new BasicBlock("if_else_" + std::to_string(currentIfId)) : nullptr;
        BasicBlock* mergeBB = new BasicBlock("if_end_" + std::to_string(currentIfId));
        
        // 评估条件表达式
        Value* condVal = nullptr;
        try {
            auto condResult = visitCond(ctx->cond());
            if (condResult.has_value()) {
                condVal = std::any_cast<Value*>(condResult);
            }
        } catch (const std::bad_any_cast& e) {
            // 如果转换失败，创建一个默认的 false 值
            condVal = builder->getInt1(false);
        }
        
        if (!condVal) {
            condVal = builder->getInt1(false);
        }
        
        // 如果条件不是 i1 类型，需要转换
        if (condVal->getType()->toString() != "i1") {
            Value* zero = builder->getInt32(0);
            condVal = builder->createICmpNE(condVal, zero);
        }
        
        // 条件跳转
        BasicBlock* falseBB = elseBB ? elseBB : mergeBB;
        builder->createCondBr(condVal, thenBB, falseBB);
        
        // 添加 thenBB 到函数
        currentFunc->addBasicBlock(thenBB);
        builder->setInsertPoint(thenBB);
        visitStmt(ctx->stmt(0));
        
        // 检查当前基本块是否被终止（可能在 visitStmt 中已经添加了 return 等）
        BasicBlock* thenBBAfter = builder->getCurrentBB();
        bool thenTerminated = thenBBAfter ? thenBBAfter->isTerminated() : false;
        
        // 如果 thenBB 没有终结指令，跳转到 mergeBB
        if (!thenTerminated) {
            builder->createBr(mergeBB);
        }
        
        // 处理 else 分支
        bool elseTerminated;
        if (ctx->ELSE() && elseBB) {
            currentFunc->addBasicBlock(elseBB);
            builder->setInsertPoint(elseBB);
            visitStmt(ctx->stmt(1));
            
            // 检查当前基本块是否被终止
            BasicBlock* elseBBAfter = builder->getCurrentBB();
            elseTerminated = elseBBAfter ? elseBBAfter->isTerminated() : false;
            
            // 如果 elseBB 没有终结指令，跳转到 mergeBB
            if (!elseTerminated) {
                builder->createBr(mergeBB);
            }
        }
        
        // 添加 mergeBB 到函数并设置插入点
        // mergeBB 总是会被使用（要么从 thenBB 跳转，要么从 elseBB 跳转，要么从条件跳转使用）
        // 即使 thenBB 和 elseBB 都有 return，mergeBB 仍然需要被添加（虽然可能永远不会被执行）
        // 但为了确保控制流图的完整性，我们总是添加 mergeBB
        currentFunc->addBasicBlock(mergeBB);
        builder->setInsertPoint(mergeBB);
    } else if (ctx->WHILE()) {
        // 实现 while 循环
        Function* currentFunc = builder->getCurrentFunction();
        BasicBlock* currentBB = builder->getCurrentBB();
        
        // 创建基本块
        int currentWhileId = whileCounter++;
        BasicBlock* condBB = new BasicBlock("while_cond_" + std::to_string(currentWhileId));
        BasicBlock* bodyBB = new BasicBlock("while_body_" + std::to_string(currentWhileId));
        BasicBlock* nextBB = new BasicBlock("while_end_" + std::to_string(currentWhileId));
        
        // 将循环信息压入栈
        LoopInfo loopInfo;
        loopInfo.condBB = condBB;
        loopInfo.bodyBB = bodyBB;
        loopInfo.nextBB = nextBB;
        loopStack.push_back(loopInfo);
        
        // 跳转到条件检查基本块
        builder->createBr(condBB);
        
        // 添加 condBB 到函数
        currentFunc->addBasicBlock(condBB);
        builder->setInsertPoint(condBB);
        
        // 评估条件表达式
        Value* condVal = nullptr;
        try {
            auto condResult = visitCond(ctx->cond());
            if (condResult.has_value()) {
                condVal = std::any_cast<Value*>(condResult);
            }
        } catch (const std::bad_any_cast& e) {
            // 如果转换失败，创建一个默认的 false 值
            condVal = builder->getInt1(false);
        }
        
        if (!condVal) {
            condVal = builder->getInt1(false);
        }
        
        // 如果条件不是 i1 类型，需要转换
        if (condVal->getType()->toString() != "i1") {
            Value* zero = builder->getInt32(0);
            condVal = builder->createICmpNE(condVal, zero);
        }
        
        // 条件跳转
        builder->createCondBr(condVal, bodyBB, nextBB);
        
        // 添加 bodyBB 到函数
        currentFunc->addBasicBlock(bodyBB);
        builder->setInsertPoint(bodyBB);
        visitStmt(ctx->stmt(0));
        
        // 检查当前基本块是否被终止（可能在 visitStmt 中已经添加了 return、break 等）
        BasicBlock* bodyBBAfter = builder->getCurrentBB();
        bool bodyTerminated = bodyBBAfter ? bodyBBAfter->isTerminated() : false;
        
        // 如果当前基本块没有终结指令，跳转到 condBB（继续循环）
        if (!bodyTerminated) {
            builder->createBr(condBB);
        }
        
        // 添加 nextBB 到函数并设置插入点
        currentFunc->addBasicBlock(nextBB);
        builder->setInsertPoint(nextBB);
        
        // 弹出循环信息
        loopStack.pop_back();
    } else if (ctx->BREAK()) {
        // 跳转到当前循环的 nextBB
        if (!loopStack.empty()) {
            BasicBlock* nextBB = loopStack.back().nextBB;
            builder->createBr(nextBB);
        }
    } else if (ctx->CONTINUE()) {
        // 跳转到当前循环的 condBB
        if (!loopStack.empty()) {
            BasicBlock* condBB = loopStack.back().condBB;
            builder->createBr(condBB);
        }
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
    DEBUG_LOCATION_INFO
    return visitAddExp(ctx->addExp());
}

// cond : lOrExp;
std::any SysYVisitor::visitCond(SysYParser::CondContext *ctx) {
    DEBUG_LOCATION_INFO
    return visitLOrExp(ctx->lOrExp());
}

// lVal : IDENT ('[' exp ']')*;
std::any SysYVisitor::visitLVal(SysYParser::LValContext *ctx) {
    DEBUG_LOCATION_INFO
    std::string name = ctx->IDENT()->getText();
    SymbolEntry* entry = symbolTable->lookup(name);
    if (!entry) {
        std::cerr << "Error: Undefined variable " << name << std::endl;
        return nullptr;
    }
    
    Value* ptr = entry->value;
    
    // 处理数组访问
    if (!ctx->exp().empty()) {
        // 收集所有索引（第一个0在createGEP中自动添加）
        std::vector<Value*> indices;
        
        for (auto expCtx : ctx->exp()) {
            Value* index = std::any_cast<Value*>(visitExp(expCtx));
            indices.push_back(index);
        }
        
        // 使用 GEP 计算元素地址
        ptr = builder->createGEP(ptr, indices);
    }
    
    return ptr;
}

// primaryExp : '(' exp ')' | lVal | number;
std::any SysYVisitor::visitPrimaryExp(SysYParser::PrimaryExpContext *ctx) {
    DEBUG_LOCATION_INFO
    if (ctx->L_PAREN() && ctx->exp()) {
        return visitExp(ctx->exp());
    } else if (ctx->lVal()) {
        Value* ptr = std::any_cast<Value*>(visitLVal(ctx->lVal()));
        std::cerr << ptr->getName() << " : " << ptr->getType()->toString() << std::endl;
        std::string ptrTypeStr = ptr->getType()->toString();
        int len = ptrTypeStr.length();
        if(ptrTypeStr[len-1] == '*' && ptrTypeStr[len-2] == ']'){
        // 返回指针
            return builder->createGEP(ptr, {builder->getInt32(0)});
        }
        else
        // 加载值
            return builder->createLoad(ptr);
    } else if (ctx->number()) {
        return visitNumber(ctx->number());
    }
    return nullptr;
}

// number : INTEGER_CONST;
std::any SysYVisitor::visitNumber(SysYParser::NumberContext *ctx) {
    DEBUG_LOCATION_INFO
    std::string text = ctx->INTEGER_CONST()->getText();
    try {
        int base = 10;
        if (text.length() > 1 && text[0] == '0') {
            if (text.length() > 2 && (text[1] == 'x' || text[1] == 'X')) {
                base = 16;
            } else {
                base = 8;
            }
        }
        int value = std::stoi(text, nullptr, base);
        return builder->getInt32(value);
    } catch (...) {
        return builder->getInt32(0);
    }
}

// unaryExp : primaryExp | IDENT '(' funcRParams? ')' | unaryOp unaryExp;
std::any SysYVisitor::visitUnaryExp(SysYParser::UnaryExpContext *ctx) {
    DEBUG_LOCATION_INFO
    if (ctx->primaryExp()) {
        return visitPrimaryExp(ctx->primaryExp());
    } else if (ctx->IDENT()) {
        // 函数调用
        std::string funcName = ctx->IDENT()->getText();
        std::vector<Value*> args;
        if (ctx->funcRParams()) {
            args = std::any_cast<std::vector<Value*>>(visitFuncRParams(ctx->funcRParams()));
        }
        
        // 查找函数
        SymbolEntry* entry = symbolTable->lookup(funcName);
        if (!entry) {
            std::cerr << "Error: Undefined function " << funcName << std::endl;
            return nullptr;
        }
        
        // 获取函数对象
        Function* callee = dynamic_cast<Function*>(entry->value);
        if (!callee) {
            std::cerr << "Error: " << funcName << " is not a function" << std::endl;
            return nullptr;
        }
        
        // 生成函数调用 IR
        Value* callResult = builder->createCall(callee, args);
        if (callResult) {
            return callResult;
        } else {
            // void 函数调用返回 nullptr，但在 SysY 中 void 函数调用不能作为表达式使用
            // 这里不应该发生，但为了安全，返回一个 void 类型的 Value
            return new Value("", TypeFactory::getVoidType());
        }
    } else if (ctx->unaryOp()) {
        Value* operand = std::any_cast<Value*>(visitUnaryExp(ctx->unaryExp()));
        std::string op = ctx->unaryOp()->getText();
        
        if (op == "+") {
            // 如果操作数是 i1 类型，需要转换为 i32
            if (operand->getType()->toString() == "i1") {
                return builder->createZExt(operand, TypeFactory::getIntType());
            }
            return operand;
        } else if (op == "-") {
            // 如果操作数是 i1 类型，需要先转换为 i32
            if (operand->getType()->toString() == "i1") {
                operand = builder->createZExt(operand, TypeFactory::getIntType());
            }
            return builder->createSub(builder->getInt32(0), operand);
        } else if (op == "!") {
            // 实现逻辑非操作：!val = (val == 0)
            // 如果操作数已经是 i1 类型，直接取反
            if (operand->getType()->toString() == "i1") {
                // 对于 i1 类型，!val = (val == 0)
                Value* zero_i1 = builder->getInt1(false);
                return builder->createICmpEQ(operand, zero_i1);
            } else {
                // 对于 i32 类型，!val = (val == 0)
                Value* zero = builder->getInt32(0);
                return builder->createICmpEQ(operand, zero);
            }
        }
    }
    return nullptr;
}

// unaryOp : '+' | '-' | '!';
std::any SysYVisitor::visitUnaryOp(SysYParser::UnaryOpContext *ctx) {
    DEBUG_LOCATION_INFO
    return ctx->getText();
}

// funcRParams : exp (',' exp)*;
std::any SysYVisitor::visitFuncRParams(SysYParser::FuncRParamsContext *ctx) {
    DEBUG_LOCATION_INFO
    std::vector<Value*> args;
    for (auto exp : ctx->exp()) {
        args.push_back(std::any_cast<Value*>(visitExp(exp)));
    }
    return args;
}

// mulExp : unaryExp | mulExp ('*' | '/' | '%') unaryExp;
std::any SysYVisitor::visitMulExp(SysYParser::MulExpContext *ctx) {
    DEBUG_LOCATION_INFO
    if (ctx->mulExp()) {
        Value* lhs = std::any_cast<Value*>(visitMulExp(ctx->mulExp()));
        Value* rhs = std::any_cast<Value*>(visitUnaryExp(ctx->unaryExp()));
        
        // 类型提升：i1 -> i32
        if (lhs->getType()->toString() == "i1") {
            lhs = builder->createZExt(lhs, TypeFactory::getIntType());
        }
        if (rhs->getType()->toString() == "i1") {
            rhs = builder->createZExt(rhs, TypeFactory::getIntType());
        }

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
    DEBUG_LOCATION_INFO
    if (ctx->addExp()) {
        Value* lhs = std::any_cast<Value*>(visitAddExp(ctx->addExp()));
        Value* rhs = std::any_cast<Value*>(visitMulExp(ctx->mulExp()));
        
        // 类型提升：i1 -> i32
        if (lhs->getType()->toString() == "i1") {
            lhs = builder->createZExt(lhs, TypeFactory::getIntType());
        }
        if (rhs->getType()->toString() == "i1") {
            rhs = builder->createZExt(rhs, TypeFactory::getIntType());
        }
        
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
    DEBUG_LOCATION_INFO
    if (ctx->relExp()) {
        Value* lhs = std::any_cast<Value*>(visitRelExp(ctx->relExp()));
        Value* rhs = std::any_cast<Value*>(visitAddExp(ctx->addExp()));
        
        // 类型提升：i1 -> i32
        if (lhs->getType()->toString() == "i1") {
            lhs = builder->createZExt(lhs, TypeFactory::getIntType());
        }
        if (rhs->getType()->toString() == "i1") {
            rhs = builder->createZExt(rhs, TypeFactory::getIntType());
        }
        
        if (ctx->LT()) {
            return builder->createICmpSLT(lhs, rhs);
        } else if (ctx->GT()) {
            return builder->createICmpSGT(lhs, rhs);
        } else if (ctx->LE()) {
            return builder->createICmpSLE(lhs, rhs);
        } else if (ctx->GE()) {
            return builder->createICmpSGE(lhs, rhs);
        }
    }
    return visitAddExp(ctx->addExp());
}

// eqExp : relExp | eqExp ('==' | '!=') relExp;
std::any SysYVisitor::visitEqExp(SysYParser::EqExpContext *ctx) {
    DEBUG_LOCATION_INFO
    if (ctx->eqExp()) {
        Value* lhs = std::any_cast<Value*>(visitEqExp(ctx->eqExp()));
        Value* rhs = std::any_cast<Value*>(visitRelExp(ctx->relExp()));
        
        // 类型提升：i1 -> i32
        if (lhs->getType()->toString() == "i1") {
            lhs = builder->createZExt(lhs, TypeFactory::getIntType());
        }
        if (rhs->getType()->toString() == "i1") {
            rhs = builder->createZExt(rhs, TypeFactory::getIntType());
        }
        
        if (ctx->EQ()) {
            return builder->createICmpEQ(lhs, rhs);
        } else if (ctx->NEQ()) {
            return builder->createICmpNE(lhs, rhs);
        }
    }
    return visitRelExp(ctx->relExp());
}

// lAndExp : eqExp | lAndExp '&&' eqExp;
std::any SysYVisitor::visitLAndExp(SysYParser::LAndExpContext *ctx) {
    DEBUG_LOCATION_INFO
    if (ctx->lAndExp()) {
        // 短路求值实现
        // 1. 计算左操作数
        Value* lhs = std::any_cast<Value*>(visitLAndExp(ctx->lAndExp()));
        
        // 类型转换转为 i1
        if (lhs->getType()->toString() != "i1") {
            lhs = builder->createICmpNE(lhs, builder->getInt32(0));
        }
        
        // 获取当前基本块（lhs结束块）
        BasicBlock* lhsBB = builder->getCurrentBB();
        Function* currentFunc = builder->getCurrentFunction();
        
        // 创建新基本块
        int count = currentFunc->getBasicBlocks().size(); // 简单计数，实际应使用更稳健的命名
        BasicBlock* rhsBB = new BasicBlock("land_rhs_" + std::to_string(count));
        BasicBlock* mergeBB = new BasicBlock("land_merge_" + std::to_string(count));
        
        // 2. 如果左操作数为真，跳转到rhsBB；否则跳转到mergeBB（结果为假）
        // 注意：如果lhs为false，我们不需要计算rhs，直接结果为false。
        builder->createCondBr(lhs, rhsBB, mergeBB);
        
        // 3. 在rhsBB中计算右操作数
        currentFunc->addBasicBlock(rhsBB);
        builder->setInsertPoint(rhsBB);
        
        Value* rhs = std::any_cast<Value*>(visitEqExp(ctx->eqExp()));
        
        // 类型转换转为 i1
        if (rhs->getType()->toString() != "i1") {
            rhs = builder->createICmpNE(rhs, builder->getInt32(0));
        }
        
        // rhs计算完后跳转到mergeBB
        builder->createBr(mergeBB);
        // 获取 rhs 结束块 (可能在 rhs 计算中生成了新块)
        BasicBlock* rhsEndBB = builder->getCurrentBB();
        
        // 4. mergeBB
        currentFunc->addBasicBlock(mergeBB);
        builder->setInsertPoint(mergeBB);
        
        // 使用 PHI 节点合并结果
        // 如果来自 lhsBB (lhs为false)，结果为 false
        // 如果来自 rhsEndBB (lhs为true，结果同rhs)，结果为 rhs
        std::vector<std::pair<Value*, BasicBlock*>> incoming;
        incoming.push_back({builder->getInt1(false), lhsBB});
        incoming.push_back({rhs, rhsEndBB});
        
        return builder->createPhi(TypeFactory::getInt1Type(), incoming);
    }
    return visitEqExp(ctx->eqExp());
}

// lOrExp : lAndExp | lOrExp '||' lAndExp;
std::any SysYVisitor::visitLOrExp(SysYParser::LOrExpContext *ctx) {
    DEBUG_LOCATION_INFO
    if (ctx->lOrExp()) {
        // 短路求值实现
        // 1. 计算左操作数
        Value* lhs = std::any_cast<Value*>(visitLOrExp(ctx->lOrExp()));
        
        // 类型转换转为 i1
        if (lhs->getType()->toString() != "i1") {
            lhs = builder->createICmpNE(lhs, builder->getInt32(0));
        }
        
        // 获取当前基本块（lhs结束块）
        BasicBlock* lhsBB = builder->getCurrentBB();
        Function* currentFunc = builder->getCurrentFunction();
        
        // 创建新基本块
        int count = currentFunc->getBasicBlocks().size();
        BasicBlock* rhsBB = new BasicBlock("lor_rhs_" + std::to_string(count));
        BasicBlock* mergeBB = new BasicBlock("lor_merge_" + std::to_string(count));
        
        // 2. 如果左操作数为真，跳转到mergeBB（结果为真）；否则跳转到rhsBB
        // 注意：如果lhs为true，我们不需要计算rhs，直接结果为true。
        builder->createCondBr(lhs, mergeBB, rhsBB);
        
        // 3. 在rhsBB中计算右操作数
        currentFunc->addBasicBlock(rhsBB);
        builder->setInsertPoint(rhsBB);
        
        Value* rhs = std::any_cast<Value*>(visitLAndExp(ctx->lAndExp()));
        
        // 类型转换转为 i1
        if (rhs->getType()->toString() != "i1") {
            rhs = builder->createICmpNE(rhs, builder->getInt32(0));
        }
        
        // rhs计算完后跳转到mergeBB
        builder->createBr(mergeBB);
        // 获取 rhs 结束块
        BasicBlock* rhsEndBB = builder->getCurrentBB();
        
        // 4. mergeBB
        currentFunc->addBasicBlock(mergeBB);
        builder->setInsertPoint(mergeBB);
        
        // 使用 PHI 节点合并结果
        // 如果来自 lhsBB (lhs为true)，结果为 true
        // 如果来自 rhsEndBB (lhs为false，结果同rhs)，结果为 rhs
        std::vector<std::pair<Value*, BasicBlock*>> incoming;
        incoming.push_back({builder->getInt1(true), lhsBB});
        incoming.push_back({rhs, rhsEndBB});
        
        return builder->createPhi(TypeFactory::getInt1Type(), incoming);
    }
    return visitLAndExp(ctx->lAndExp());
}

// constExp : addExp;
std::any SysYVisitor::visitConstExp(SysYParser::ConstExpContext *ctx) {
    DEBUG_LOCATION_INFO
    return visitChildren(ctx);
}

std::shared_ptr<Type> SysYVisitor::getTypeFromString(const std::string& typeStr) {
    DEBUG_LOCATION_INFO
    if (typeStr == "int") return TypeFactory::getIntType();
    if (typeStr == "void") return TypeFactory::getVoidType();
    return TypeFactory::getIntType();
}

int SysYVisitor::evaluateConstExp(SysYParser::ConstExpContext *ctx) {
    DEBUG_LOCATION_INFO
    // constExp : addExp;
    if (!ctx || !ctx->addExp()) {
        return 0;
    }
    return evaluateAddExp(ctx->addExp());
}


int SysYVisitor::evaluateAddExp(SysYParser::AddExpContext *ctx) {
    DEBUG_LOCATION_INFO
    if (!ctx) return 0;
    
    if (ctx->addExp()) {
        int lhs = evaluateAddExp(ctx->addExp());
        int rhs = evaluateMulExp(ctx->mulExp());
        
        if (ctx->PLUS()) {
            return lhs + rhs;
        } else if (ctx->MINUS()) {
            return lhs - rhs;
        }
    }
    return evaluateMulExp(ctx->mulExp());
}

int SysYVisitor::evaluateMulExp(SysYParser::MulExpContext *ctx) {
    DEBUG_LOCATION_INFO
    if (!ctx) return 0;
    
    if (ctx->mulExp()) {
        int lhs = evaluateMulExp(ctx->mulExp());
        int rhs = evaluateUnaryExp(ctx->unaryExp());
        
        if (ctx->MUL()) {
            return lhs * rhs;
        } else if (ctx->DIV()) {
            return rhs != 0 ? lhs / rhs : 0;
        } else if (ctx->MOD()) {
            return rhs != 0 ? lhs % rhs : 0;
        }
    }
    return evaluateUnaryExp(ctx->unaryExp());
}

int SysYVisitor::evaluateUnaryExp(SysYParser::UnaryExpContext *ctx) {
    DEBUG_LOCATION_INFO
    if (!ctx) return 0;
    
    if (ctx->primaryExp()) {
        return evaluatePrimaryExp(ctx->primaryExp());
    } else if (ctx->unaryOp()) {
        int val = evaluateUnaryExp(ctx->unaryExp());
        std::string op = ctx->unaryOp()->getText();
        
        if (op == "+") {
            return val;
        } else if (op == "-") {
            return -val;
        } else if (op == "!") {
            return val == 0 ? 1 : 0;
        }
    }
    return 0;
}

int SysYVisitor::evaluatePrimaryExp(SysYParser::PrimaryExpContext *ctx) {
    DEBUG_LOCATION_INFO
    if (!ctx) return 0;
    
    if (ctx->number()) {
        return evaluateNumber(ctx->number());
    } else if (ctx->lVal()) {
        // 处理常量变量访问
        std::string name = ctx->lVal()->IDENT()->getText();
        SymbolEntry* entry = symbolTable->lookup(name);
        if (entry && entry->isConst && ctx->lVal()->exp().empty()) {
            // 如果是常量标量变量（没有数组索引），返回其值
            return entry->constValue;
        }
        return 0;
    } else if (ctx->L_PAREN() && ctx->exp()) {
        return evaluateExp(ctx->exp());
    }
    return 0;
}

int SysYVisitor::evaluateExp(SysYParser::ExpContext *ctx) {
    if (!ctx || !ctx->addExp()) return 0;
    return evaluateAddExp(ctx->addExp());
}

int SysYVisitor::evaluateNumber(SysYParser::NumberContext *ctx) {
    DEBUG_LOCATION_INFO
    if (!ctx || !ctx->INTEGER_CONST()) return 0;
    
    std::string text = ctx->INTEGER_CONST()->getText();
    try {
        // 支持十进制、八进制(0开头)、十六进制(0x开头)
        int base = 10;
        if (text.length() > 1 && text[0] == '0') {
            if (text.length() > 2 && (text[1] == 'x' || text[1] == 'X')) {
                base = 16;
            } else {
                base = 8;
            }
        }
        return std::stoi(text, nullptr, base);
    } catch (...) {
        return 0;
    }
}

// 数组初始化辅助函数 - 使用线性索引
void SysYVisitor::initializeArray(Value* arrayPtr, std::shared_ptr<Type> arrayType, 
                                  SysYParser::InitValContext* initValCtx, 
                                  const std::vector<uint64_t>& dimensions, int& linearIndex) {
    DEBUG_LOCATION_INFO
    if (!initValCtx) return;
    
    // 如果是标量表达式，直接存储到当前位置
    if (initValCtx->exp()) {
        Value* val = std::any_cast<Value*>(visitExp(initValCtx->exp()));
        if (val) {
            // 计算多维索引：对于 [4 x [2 x i32]]，需要 [i, j] 两个索引（第一个0在createGEP中自动添加）
            std::vector<Value*> indices;
            int tempIndex = linearIndex;
            for (size_t i = 0; i < dimensions.size(); ++i) {
                uint64_t stride = 1;
                for (size_t j = i + 1; j < dimensions.size(); ++j) {
                    stride *= dimensions[j];
                }
                int idx = tempIndex / stride;
                indices.push_back(builder->getInt32(idx));
                tempIndex %= stride;
            }
            Value* elemPtr = builder->createGEP(arrayPtr, indices);
            builder->createStore(val, elemPtr);
            linearIndex++;
        }
        return;
    }
    
    // 处理初始化列表
    if (initValCtx->initVal().empty()) {
        // 空列表，不初始化（保持0值）
        return;
    }
    
    uint64_t totalElements = std::accumulate(dimensions.begin(), dimensions.end(), 1, std::multiplies<uint64_t>());
    
    // 处理混合初始化列表：支持扁平值和嵌套列表混合
    for (auto initVal : initValCtx->initVal()) {
        if (linearIndex >= totalElements) break;
        
        if (initVal->exp()) {
            // 单个值：按行优先顺序填充
            Value* val = std::any_cast<Value*>(visitExp(initVal->exp()));
            if (val) {
                // 计算多维索引：对于 [4 x [2 x i32]]，需要 [i, j] 两个索引（第一个0在createGEP中自动添加）
                std::vector<Value*> indices;
                int tempIndex = linearIndex;
                for (size_t i = 0; i < dimensions.size(); ++i) {
                    uint64_t stride = 1;
                    for (size_t j = i + 1; j < dimensions.size(); ++j) {
                        stride *= dimensions[j];
                    }
                    int idx = tempIndex / stride;
                    indices.push_back(builder->getInt32(idx));
                    tempIndex %= stride;
                }
                Value* elemPtr = builder->createGEP(arrayPtr, indices);
                builder->createStore(val, elemPtr);
                linearIndex++;
            }
        } else {
            // 嵌套列表：初始化当前子数组
            auto arrayTypePtr = std::dynamic_pointer_cast<ArrayType>(arrayType);
            if (arrayTypePtr && dimensions.size() > 1) {
                // 计算当前子数组的索引
                uint64_t subArraySize = std::accumulate(dimensions.begin() + 1, dimensions.end(), 1, std::multiplies<uint64_t>());
                int subArrayIndex = linearIndex / subArraySize;
                
                // 计算子数组的起始位置（第一个0在createGEP中自动添加）
                std::vector<Value*> indices;
                indices.push_back(builder->getInt32(subArrayIndex));
                Value* subArrayPtr = builder->createGEP(arrayPtr, indices);
                
                // 递归初始化子数组
                std::vector<uint64_t> subDimensions(dimensions.begin() + 1, dimensions.end());
                int startLinearIndex = linearIndex;
                int subLinearIndex = startLinearIndex % subArraySize;  // 子数组内的线性索引
                initializeArray(subArrayPtr, arrayTypePtr->getElementType(), initVal, subDimensions, subLinearIndex);
                // 更新 linearIndex：子数组初始化后，linearIndex 应该指向下一个子数组的开始
                linearIndex = (subArrayIndex + 1) * subArraySize;
            }
        }
    }
}

void SysYVisitor::initializeArrayConst(Value* arrayPtr, std::shared_ptr<Type> arrayType, 
                                       SysYParser::ConstInitValContext* constInitValCtx, 
                                       const std::vector<uint64_t>& dimensions, int& linearIndex) {
    DEBUG_LOCATION_INFO
    if (!constInitValCtx) return;
    
    // 如果是标量常量表达式，直接存储到当前位置
    if (constInitValCtx->constExp()) {
        int constVal = evaluateConstExp(constInitValCtx->constExp());
        Value* val = builder->getInt32(constVal);
        // 计算多维索引：对于 [4 x [2 x i32]]，需要 [i, j] 两个索引（第一个0在createGEP中自动添加）
        std::vector<Value*> indices;
        int tempIndex = linearIndex;
        for (size_t i = 0; i < dimensions.size(); ++i) {
            uint64_t stride = 1;
            for (size_t j = i + 1; j < dimensions.size(); ++j) {
                stride *= dimensions[j];
            }
            int idx = tempIndex / stride;
            indices.push_back(builder->getInt32(idx));
            tempIndex %= stride;
        }
        Value* elemPtr = builder->createGEP(arrayPtr, indices);
        builder->createStore(val, elemPtr);
        linearIndex++;
        return;
    }
    
    // 处理初始化列表
    if (constInitValCtx->constInitVal().empty()) {
        // 空列表，不初始化（保持0值）
        return;
    }
    
    uint64_t totalElements = std::accumulate(dimensions.begin(), dimensions.end(), 1, std::multiplies<uint64_t>());
    
    // 处理混合初始化列表：支持扁平值和嵌套列表混合
    for (auto constInitVal : constInitValCtx->constInitVal()) {
        if (linearIndex >= totalElements) break;
        
        if (constInitVal->constExp()) {
            // 单个值：按行优先顺序填充
            int constVal = evaluateConstExp(constInitVal->constExp());
            Value* val = builder->getInt32(constVal);
            // 计算多维索引：对于 [4 x [2 x i32]]，需要 [i, j] 两个索引（第一个0在createGEP中自动添加）
            std::vector<Value*> indices;
            int tempIndex = linearIndex;
            for (size_t i = 0; i < dimensions.size(); ++i) {
                uint64_t stride = 1;
                for (size_t j = i + 1; j < dimensions.size(); ++j) {
                    stride *= dimensions[j];
                }
                int idx = tempIndex / stride;
                indices.push_back(builder->getInt32(idx));
                tempIndex %= stride;
            }
            Value* elemPtr = builder->createGEP(arrayPtr, indices);
            builder->createStore(val, elemPtr);
            linearIndex++;
        } else {
            // 嵌套列表：初始化当前子数组
            auto arrayTypePtr = std::dynamic_pointer_cast<ArrayType>(arrayType);
            if (arrayTypePtr && dimensions.size() > 1) {
                // 计算当前子数组的索引
                uint64_t subArraySize = std::accumulate(dimensions.begin() + 1, dimensions.end(), 1, std::multiplies<uint64_t>());
                int subArrayIndex = linearIndex / subArraySize;
                
                // 计算子数组的起始位置（第一个0在createGEP中自动添加）
                std::vector<Value*> indices;
                indices.push_back(builder->getInt32(subArrayIndex));
                Value* subArrayPtr = builder->createGEP(arrayPtr, indices);
                
                // 递归初始化子数组
                std::vector<uint64_t> subDimensions(dimensions.begin() + 1, dimensions.end());
                int startLinearIndex = linearIndex;
                int subLinearIndex = startLinearIndex % subArraySize;  // 子数组内的线性索引
                initializeArrayConst(subArrayPtr, arrayTypePtr->getElementType(), constInitVal, subDimensions, subLinearIndex);
                // 更新 linearIndex：子数组初始化后，linearIndex 应该指向下一个子数组的开始
                linearIndex = (subArrayIndex + 1) * subArraySize;
            }
        }
    }
}

// 辅助函数：递归生成数组初始化字符串
static std::string helperRecursiveArrayInit(const std::vector<int>& values, 
                                          const std::vector<uint64_t>& dimensions, 
                                          int& offset) {
    if (dimensions.empty()) return "";

    std::string elemTypeStr = "i32";
    if (dimensions.size() > 1) {
        elemTypeStr = "i32";
        for (int k = dimensions.size() - 1; k >= 1; --k) {
            elemTypeStr = "[" + std::to_string(dimensions[k]) + " x " + elemTypeStr + "]";
        }
    }
    
    std::string result = "[";
    uint64_t count = dimensions[0];
    
    for (size_t i = 0; i < count; ++i) {
        if (i > 0) result += ", ";
        
        result += elemTypeStr + " ";
        
        if (dimensions.size() == 1) {
            result += std::to_string(values[offset]);
            offset++;
        } else {
            std::vector<uint64_t> subDims(dimensions.begin() + 1, dimensions.end());
            result += helperRecursiveArrayInit(values, subDims, offset);
        }
    }
    result += "]";
    return result;
}

// 生成全局常量数组初始化器字符串
std::string SysYVisitor::generateGlobalArrayInitializer(SysYParser::ConstInitValContext* constInitValCtx, 
                                                         const std::vector<uint64_t>& dimensions) {
    DEBUG_LOCATION_INFO
    if (!constInitValCtx) {
        return "zeroinitializer";
    }
    
    uint64_t totalElements = std::accumulate(dimensions.begin(), dimensions.end(), 1, std::multiplies<uint64_t>());
    std::vector<int> values(totalElements, 0);
    int linearIndex = 0;
    
    evaluateConstInitValToList(constInitValCtx, dimensions, values, linearIndex);
    
    // 生成初始化器字符串
    int offset = 0;
    return helperRecursiveArrayInit(values, dimensions, offset);
}

std::string SysYVisitor::generateGlobalArrayInitializer(SysYParser::InitValContext* initValCtx, 
                                                         const std::vector<uint64_t>& dimensions) {
    DEBUG_LOCATION_INFO
    if (!initValCtx) {
        return "zeroinitializer";
    }
    
    uint64_t totalElements = std::accumulate(dimensions.begin(), dimensions.end(), 1, std::multiplies<uint64_t>());
    std::vector<int> values(totalElements, 0);
    int linearIndex = 0;
    
    evaluateInitValToList(initValCtx, dimensions, values, linearIndex);
    
    // 生成初始化器字符串
    int offset = 0;
    return helperRecursiveArrayInit(values, dimensions, offset);
}

// 将常量初始化值列表转换为值数组
void SysYVisitor::evaluateConstInitValToList(SysYParser::ConstInitValContext* constInitValCtx,
                                              const std::vector<uint64_t>& dimensions,
                                              std::vector<int>& values, int& linearIndex) {
    DEBUG_LOCATION_INFO
    if (!constInitValCtx) return;
    
    uint64_t totalElements = std::accumulate(dimensions.begin(), dimensions.end(), 1, std::multiplies<uint64_t>());
    int startLinearIndex = linearIndex;
    
    // 如果是标量常量表达式
    if (constInitValCtx->constExp()) {
        if (linearIndex < static_cast<int>(values.size())) {
            values[linearIndex] = evaluateConstExp(constInitValCtx->constExp());
            linearIndex++;
        }
        return;
    }
    
    // 处理初始化列表
    if (constInitValCtx->constInitVal().empty()) {
        // 空列表，保持0值
        return;
    }
    
    // 处理混合初始化列表
    for (auto constInitVal : constInitValCtx->constInitVal()) {
        if (linearIndex - startLinearIndex >= static_cast<int>(totalElements)) break;
        
        if (constInitVal->constExp()) {
            // 单个值：按行优先顺序填充
            values[linearIndex] = evaluateConstExp(constInitVal->constExp());
            linearIndex++;
        } else {
            // 嵌套列表：递归处理
            if (dimensions.size() > 1) {
                uint64_t subArraySize = std::accumulate(dimensions.begin() + 1, dimensions.end(), 1, std::multiplies<uint64_t>());
                int subArrayIndex = linearIndex / subArraySize;
                
                // 递归处理子数组
                std::vector<uint64_t> subDimensions(dimensions.begin() + 1, dimensions.end());
                // int oldLinearIndex = linearIndex; // unused
                evaluateConstInitValToList(constInitVal, subDimensions, values, linearIndex);
                
                // 填充剩余部分：移动 linearIndex 到当前子数组的结束位置
                int nextBoundary = (subArrayIndex + 1) * subArraySize;
                if (linearIndex < nextBoundary) {
                    linearIndex = nextBoundary;
                }
            }
        }
    }
}

void SysYVisitor::evaluateInitValToList(SysYParser::InitValContext* initValCtx,
                                              const std::vector<uint64_t>& dimensions,
                                              std::vector<int>& values, int& linearIndex) {
    DEBUG_LOCATION_INFO
    if (!initValCtx) return;
    
    uint64_t totalElements = std::accumulate(dimensions.begin(), dimensions.end(), 1, std::multiplies<uint64_t>());
    int startLinearIndex = linearIndex;
    
    // 如果是标量常量表达式
    if (initValCtx->exp()) {
        if (linearIndex < static_cast<int>(values.size())) {
            values[linearIndex] = evaluateExp(initValCtx->exp());
            linearIndex++;
        }
        return;
    }
    
    // 处理初始化列表
    if (initValCtx->initVal().empty()) {
        // 空列表，保持0值
        return;
    }
    
    // 处理混合初始化列表
    for (auto initVal : initValCtx->initVal()) {
        if (linearIndex - startLinearIndex >= static_cast<int>(totalElements)) break;
        
        if (initVal->exp()) {
            // 单个值：按行优先顺序填充
            int val = evaluateExp(initVal->exp());
            values[linearIndex] = val;
            linearIndex++;
        } else {
            // 嵌套列表：递归处理
            if (dimensions.size() > 1) {
                uint64_t subArraySize = std::accumulate(dimensions.begin() + 1, dimensions.end(), 1, std::multiplies<uint64_t>());
                int subArrayIndex = linearIndex / subArraySize;
                
                // 递归处理子数组
                std::vector<uint64_t> subDimensions(dimensions.begin() + 1, dimensions.end());
                // int oldLinearIndex = linearIndex; // unused
                evaluateInitValToList(initVal, subDimensions, values, linearIndex);
                
                // 填充剩余部分：移动 linearIndex 到当前子数组的结束位置
                int nextBoundary = (subArrayIndex + 1) * subArraySize;
                if (linearIndex < nextBoundary) {
                    linearIndex = nextBoundary;
                }
            }
        }
    }
}

// 初始化外部库函数
void SysYVisitor::initializeExternalFunctions() {
    // putint: void putint(int a)
    DEBUG_LOCATION_INFO
    std::vector<std::shared_ptr<Type>> putintParams;
    putintParams.push_back(TypeFactory::getIntType());
    auto putintType = TypeFactory::getFunctionType(TypeFactory::getVoidType(), putintParams);
    Function* putintFunc = new Function("putint", putintType, true);
    putintFunc->getArguments().push_back(new Value("a", TypeFactory::getIntType()));
    context->getModule()->addFunction(putintFunc);
    symbolTable->addSymbol("putint", putintType, putintFunc, false, true, 0);
    
    // getint: int getint()
    std::vector<std::shared_ptr<Type>> getintParams;
    auto getintType = TypeFactory::getFunctionType(TypeFactory::getIntType(), getintParams);
    Function* getintFunc = new Function("getint", getintType, true);
    context->getModule()->addFunction(getintFunc);
    symbolTable->addSymbol("getint", getintType, getintFunc, false, true, 0);
    
    // putch: void putch(int a)
    std::vector<std::shared_ptr<Type>> putchParams;
    putchParams.push_back(TypeFactory::getIntType());
    auto putchType = TypeFactory::getFunctionType(TypeFactory::getVoidType(), putchParams);
    Function* putchFunc = new Function("putch", putchType, true);
    putchFunc->getArguments().push_back(new Value("a", TypeFactory::getIntType()));
    context->getModule()->addFunction(putchFunc);
    symbolTable->addSymbol("putch", putchType, putchFunc, false, true, 0);
    
    // getch: int getch()
    std::vector<std::shared_ptr<Type>> getchParams;
    auto getchType = TypeFactory::getFunctionType(TypeFactory::getIntType(), getchParams);
    Function* getchFunc = new Function("getch", getchType, true);
    context->getModule()->addFunction(getchFunc);
    symbolTable->addSymbol("getch", getchType, getchFunc, false, true, 0);
    
    // putarray: void putarray(int n, int a[])
    std::vector<std::shared_ptr<Type>> putarrayParams;
    putarrayParams.push_back(TypeFactory::getIntType());
    putarrayParams.push_back(TypeFactory::getPointerType(TypeFactory::getIntType()));
    auto putarrayType = TypeFactory::getFunctionType(TypeFactory::getVoidType(), putarrayParams);
    Function* putarrayFunc = new Function("putarray", putarrayType, true);
    putarrayFunc->getArguments().push_back(new Value("n", TypeFactory::getIntType()));
    putarrayFunc->getArguments().push_back(new Value("a", TypeFactory::getPointerType(TypeFactory::getIntType())));
    context->getModule()->addFunction(putarrayFunc);
    symbolTable->addSymbol("putarray", putarrayType, putarrayFunc, false, true, 0);
    
    // getarray: int getarray(int a[])
    std::vector<std::shared_ptr<Type>> getarrayParams;
    getarrayParams.push_back(TypeFactory::getPointerType(TypeFactory::getIntType()));
    auto getarrayType = TypeFactory::getFunctionType(TypeFactory::getIntType(), getarrayParams);
    Function* getarrayFunc = new Function("getarray", getarrayType, true);
    getarrayFunc->getArguments().push_back(new Value("a", TypeFactory::getPointerType(TypeFactory::getIntType())));
    context->getModule()->addFunction(getarrayFunc);
    symbolTable->addSymbol("getarray", getarrayType, getarrayFunc, false, true, 0);
}
