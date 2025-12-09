#pragma once

#include "Value.h"
#include "BasicBlock.h"
#include "Type.h"
#include <vector>
#include <string>
#include <memory>
#include <iostream>

class Function : public Value {
private:
    std::vector<BasicBlock*> basicBlocks;
    std::vector<Value*> args;
    
public:
    Function(const std::string& name, std::shared_ptr<Type> type) 
        : Value(name, type) {}
    
    void addBasicBlock(BasicBlock* bb) {
        basicBlocks.push_back(bb);
    }
    
    std::vector<BasicBlock*>& getBasicBlocks() { return basicBlocks; }
    
    std::string toString() const {
        // Cast to FunctionType to get return type
        auto funcType = std::static_pointer_cast<FunctionType>(getType());
        std::string result = "define " + funcType->getReturnType()->toString() + " @" + getName() + "() {\n";
        for (auto bb : basicBlocks) {
            result += bb->toString();
        }
        result += "}\n";
        return result;
    }

    std::vector<Value*>& getArguments() { return args; }
};

class Module {
private:
    std::string moduleName;
    std::vector<Function*> functions;
    
public:
    Module(const std::string& name) : moduleName(name) {}
    
    void addFunction(Function* func) {
        functions.push_back(func);
    }
    
    std::string toString() const {
        std::string result = "; ModuleID = '" + moduleName + "'\n";
        for (auto func : functions) {
            result += func->toString() + "\n";
        }
        return result;
    }
};
