#pragma once

#include "Value.h"
#include "BasicBlock.h"
#include "Type.h"
#include <vector>
#include <string>
#include <memory>
#include <iostream>

class GlobalVariable;

class Function : public Value {
private:
    std::vector<BasicBlock*> basicBlocks;
    std::vector<Value*> args;
    bool isExternal;  // 是否是外部函数声明
    
public:
    Function(const std::string& name, std::shared_ptr<Type> type, bool isExternal = false) 
        : Value(name, type), isExternal(isExternal) {}
    
    void addBasicBlock(BasicBlock* bb) {
        basicBlocks.push_back(bb);
    }
    
    std::vector<BasicBlock*>& getBasicBlocks() { return basicBlocks; }
    
    bool getIsExternal() const { return isExternal; }
    
    std::string toString() const {
        // Cast to FunctionType to get return type
        auto funcType = std::static_pointer_cast<FunctionType>(getType());
        
        if (isExternal) {
            // 外部函数声明
            std::string result = "declare " + funcType->getReturnType()->toString() + " @" + getName() + "(";
            
            // 输出参数列表
            for (size_t i = 0; i < args.size(); ++i) {
                if (i > 0) result += ", ";
                result += args[i]->getType()->toString();
            }
            result += ")\n";
            return result;
        } else {
            // 函数定义
            std::string result = "define " + funcType->getReturnType()->toString() + " @" + getName() + "(";
            
            // 输出参数列表
            for (size_t i = 0; i < args.size(); ++i) {
                if (i > 0) result += ", ";
                result += args[i]->getType()->toString() + " %" + args[i]->getName();
            }
            result += ") {\n";
            
            for (auto bb : basicBlocks) {
                std::string bbStr = bb->toString();
                // 输出所有基本块（包括空的，因为它们可能被引用）
                result += bbStr;
            }
            result += "}\n";
            return result;
        }
    }

    std::vector<Value*>& getArguments() { return args; }
};

class GlobalVariable : public Value {
private:
    Value* initializer;
    bool isConst;
    
public:
    GlobalVariable(const std::string& name, std::shared_ptr<Type> type, Value* init = nullptr, bool isConst = false)
        : Value(name, type), initializer(init), isConst(isConst) {}
    
    Value* getInitializer() const { return initializer; }
    bool getIsConst() const { return isConst; }
    void setInitializer(Value* init) { initializer = init; }
    
    std::string toString() const {
        std::string result = "@" + getName() + " = ";
        if (isConst) {
            result += "constant ";
        } else {
            result += "global ";
        }
        // 全局变量的类型是指针类型，需要获取指向的类型
        auto ptrType = std::dynamic_pointer_cast<PointerType>(getType());
        if (ptrType) {
            result += ptrType->getPointedType()->toString();
        } else {
            result += getType()->toString();
        }
        if (initializer) {
            std::string initStr = initializer->getName();
            // 检查是否是数组初始化器（以 [ 开头）
            if (initStr.find('[') == 0) {
                // 数组初始化器
                result += " " + initStr;
            } else if (initStr.find_first_not_of("-0123456789") == std::string::npos) {
                // 数字常量
                result += " " + initStr;
            } else {
                // 其他值
                result += " %" + initStr;
            }
        } else {
            result += " zeroinitializer";
        }
        result += ", align 4\n";
        return result;
    }
};

class Module {
private:
    std::string moduleName;
    std::vector<Function*> functions;
    std::vector<GlobalVariable*> globalVars;
    
public:
    Module(const std::string& name) : moduleName(name) {}
    
    void addFunction(Function* func) {
        functions.push_back(func);
    }
    
    void addGlobalVariable(GlobalVariable* gvar) {
        globalVars.push_back(gvar);
    }
    
    std::string toString() const {
        std::string result = "; ModuleID = '" + moduleName + "'\n";
        result += "source_filename = \"" + moduleName + "\"\n\n";
        
        // 输出全局变量
        for (auto gvar : globalVars) {
            result += gvar->toString();
        }
        
        // 先输出外部函数声明，再输出函数定义
        for (auto func : functions) {
            if (func->getIsExternal()) {
                result += func->toString();
            }
        }
        
        for (auto func : functions) {
            if (!func->getIsExternal()) {
                result += func->toString() + "\n";
            }
        }
        return result;
    }
};
