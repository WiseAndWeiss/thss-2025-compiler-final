// include/SysYVisitor.h
#pragma once

#include "SysYParser.h"
#include "SysYLexer.h"
#include "SysYParserBaseVisitor.h"
#include "IRBuilder.h"
#include "SymbolTable.h"
#include "LLVMContext.h"
#include <antlr4-runtime.h>


class SysYVisitor : public SysYParserBaseVisitor {
protected:
    LLVMContext* context;
    IRBuilder* builder;
    SymbolTable* symbolTable;
    
    // 循环信息结构体（用于 break/continue）
    struct LoopInfo {
        BasicBlock* condBB;   // 条件检查基本块
        BasicBlock* bodyBB;  // 循环体基本块
        BasicBlock* nextBB;  // 循环后基本块
    };
    std::vector<LoopInfo> loopStack;  // 循环栈，用于嵌套循环
    int ifCounter;  // if-else 语句计数器，用于生成唯一的基本块名称
    int whileCounter;  // while 语句计数器，用于生成唯一的基本块名称
    
public:
    SysYVisitor(LLVMContext* ctx) : context(ctx), 
        builder(ctx->getBuilder()), symbolTable(ctx->getSymbolTable()), ifCounter(0), whileCounter(0) {}
    
    // 重写关键visit方法
    std::any visitCompUnit(SysYParser::CompUnitContext *ctx) override;
    std::any visitDecl(SysYParser::DeclContext *ctx) override;
    std::any visitConstDecl(SysYParser::ConstDeclContext *ctx) override;
    std::any visitBType(SysYParser::BTypeContext *ctx) override;
    std::any visitConstDef(SysYParser::ConstDefContext *ctx) override;
    std::any visitConstInitVal(SysYParser::ConstInitValContext *ctx) override;
    std::any visitVarDecl(SysYParser::VarDeclContext *ctx) override;
    std::any visitVarDef(SysYParser::VarDefContext *ctx) override;
    std::any visitInitVal(SysYParser::InitValContext *ctx) override;
    std::any visitFuncDef(SysYParser::FuncDefContext *ctx) override;
    std::any visitFuncType(SysYParser::FuncTypeContext *ctx) override;
    std::any visitFuncFParams(SysYParser::FuncFParamsContext *ctx)override;
    std::any visitFuncFParam(SysYParser::FuncFParamContext *ctx) override;
    std::any visitBlock(SysYParser::BlockContext *ctx) override;
    std::any visitBlockItem(SysYParser::BlockItemContext *ctx) override;
    std::any visitStmt(SysYParser::StmtContext *ctx) override;
    std::any visitExp(SysYParser::ExpContext *ctx) override;
    std::any visitCond(SysYParser::CondContext *ctx) override;
    std::any visitLVal(SysYParser::LValContext *ctx) override;
    std::any visitPrimaryExp(SysYParser::PrimaryExpContext *ctx) override;
    std::any visitNumber(SysYParser::NumberContext *ctx) override;
    std::any visitUnaryExp(SysYParser::UnaryExpContext *ctx) override;
    std::any visitUnaryOp(SysYParser::UnaryOpContext *ctx) override;
    std::any visitFuncRParams(SysYParser::FuncRParamsContext *ctx)override;
    std::any visitMulExp(SysYParser::MulExpContext *ctx) override;
    std::any visitAddExp(SysYParser::AddExpContext *ctx) override;
    std::any visitRelExp(SysYParser::RelExpContext *ctx) override;
    std::any visitEqExp(SysYParser::EqExpContext *ctx) override;
    std::any visitLAndExp(SysYParser::LAndExpContext *ctx)override;
    std::any visitLOrExp(SysYParser::LOrExpContext *ctx) override;
    std::any visitConstExp(SysYParser::ConstExpContext *ctx) override;
    
    // 工具方法
    std::shared_ptr<Type> getTypeFromString(const std::string& typeStr);
    int evaluateConstExp(SysYParser::ConstExpContext *ctx);
    int evaluateAddExp(SysYParser::AddExpContext *ctx);
    int evaluateMulExp(SysYParser::MulExpContext *ctx);
    int evaluateUnaryExp(SysYParser::UnaryExpContext *ctx);
    int evaluatePrimaryExp(SysYParser::PrimaryExpContext *ctx);
    int evaluateExp(SysYParser::ExpContext *ctx);
    int evaluateNumber(SysYParser::NumberContext *ctx);
    
    // 数组初始化辅助函数
    void initializeArray(Value* arrayPtr, std::shared_ptr<Type> arrayType, 
                        SysYParser::InitValContext* initValCtx, 
                        const std::vector<uint64_t>& dimensions, int& linearIndex);
    void initializeArrayConst(Value* arrayPtr, std::shared_ptr<Type> arrayType, 
                            SysYParser::ConstInitValContext* constInitValCtx, 
                            const std::vector<uint64_t>& dimensions, int& linearIndex);
    
    // 全局常量数组初始化辅助函数
    std::string generateGlobalArrayInitializer(SysYParser::ConstInitValContext* constInitValCtx, 
                                               const std::vector<uint64_t>& dimensions);
    void evaluateConstInitValToList(SysYParser::ConstInitValContext* constInitValCtx,
                                    const std::vector<uint64_t>& dimensions,
                                    std::vector<int>& values, int& linearIndex);
    
    // 初始化外部库函数
    void initializeExternalFunctions();
};