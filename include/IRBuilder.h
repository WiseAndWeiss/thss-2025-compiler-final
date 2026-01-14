// include/IRBuilder.h
#pragma once

#include "Type.h"
#include "Value.h"
#include "Module.h"
#include "BasicBlock.h"
#include <string>
#include <vector>

// 前置声明LLVM类型（实际使用时替换为真实LLVM类型）
namespace llvm {
    class Value;
    class Type;
    class BasicBlock;
    class Function;
}

class IRBuilder {
private:
    Module* module;
    BasicBlock* currentBB;
    Function* currentFunc;
    std::string indent;  // 用于格式化输出
    int tempCounter;     // 用于生成唯一的临时变量名
    
public:
    IRBuilder(Module* mod = nullptr) 
        : module(mod), currentBB(nullptr), currentFunc(nullptr), indent("    "), tempCounter(0) {}
    
    // 设置当前插入点
    void setInsertPoint(BasicBlock* bb) { currentBB = bb; }
    void setCurrentFunction(Function* func) { currentFunc = func; }
    
    BasicBlock* getCurrentBB() { return currentBB; }
    Function* getCurrentFunction() { return currentFunc; }
    
    // 常量创建
    Value* getInt32(int value);
    Value* getInt1(bool value);
    
    // 内存操作指令
    Value* createAlloca(std::shared_ptr<Type> type, const std::string& name = "");
    Value* createLoad(Value* ptr, const std::string& name = "");
    Value* createStore(Value* value, Value* ptr);
    Value* createGEP(Value* ptr, const std::vector<Value*>& indices, const std::string& name = "");
    
    // 全局变量操作
    Value* createGlobalVariable(const std::string& name, std::shared_ptr<Type> type, 
                                const std::string& initStr, bool isConst);
    Value* createGlobalVariable(const std::string& name, std::shared_ptr<Type> type, 
                                Value* initializer = nullptr, bool isConst = false);
    
    // 算术运算指令
    Value* createAdd(Value* lhs, Value* rhs, const std::string& name = "");
    Value* createSub(Value* lhs, Value* rhs, const std::string& name = "");
    Value* createMul(Value* lhs, Value* rhs, const std::string& name = "");
    Value* createSDiv(Value* lhs, Value* rhs, const std::string& name = "");
    Value* createSRem(Value* lhs, Value* rhs, const std::string& name = "");
    
    // 比较指令
    Value* createICmpEQ(Value* lhs, Value* rhs, const std::string& name = "");
    Value* createICmpNE(Value* lhs, Value* rhs, const std::string& name = "");
    Value* createICmpSLT(Value* lhs, Value* rhs, const std::string& name = "");
    Value* createICmpSLE(Value* lhs, Value* rhs, const std::string& name = "");
    Value* createICmpSGT(Value* lhs, Value* rhs, const std::string& name = "");
    Value* createICmpSGE(Value* lhs, Value* rhs, const std::string& name = "");
    
    // 控制流指令
    void createRet(Value* retValue = nullptr);
    void createBr(BasicBlock* target);
    void createCondBr(Value* cond, BasicBlock* trueBB, BasicBlock* falseBB);
    
    // 函数相关
    Value* createCall(Function* callee, const std::vector<Value*>& args, const std::string& name = "");
    
    // 类型转换
    Value* createZExt(Value* value, std::shared_ptr<Type> destType, const std::string& name = "");
    Value* createSExt(Value* value, std::shared_ptr<Type> destType, const std::string& name = "");
    Value* createTrunc(Value* value, std::shared_ptr<Type> destType, const std::string& name = "");
    
    // 辅助函数
    std::string getIndent() const { return indent; }
    void increaseIndent() { indent += "    "; }
    void decreaseIndent() { 
        if (indent.length() >= 4) 
            indent = indent.substr(0, indent.length() - 4); 
    }
    void addInstruction(const std::string& instruction);
    
    // 生成唯一的临时变量名
    std::string generateTempName(const std::string& prefix = "temp");
};
