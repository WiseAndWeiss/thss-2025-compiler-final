// include/LLVMContext.h
#pragma once

#include "IRBuilder.h"
#include "SymbolTable.h"
#include "Type.h"
#include <memory>
#include <string>

class LLVMContext {
private:
    std::unique_ptr<Module> module;
    std::unique_ptr<IRBuilder> builder;
    std::unique_ptr<SymbolTable> symbolTable;
    
public:
    LLVMContext(const std::string& moduleName = "sysy_module");
    ~LLVMContext();
    
    // 获取组件
    Module* getModule() { return module.get(); }
    IRBuilder* getBuilder() { return builder.get(); }
    SymbolTable* getSymbolTable() { return symbolTable.get(); }
    
    // 类型创建
    std::shared_ptr<Type> getInt32Type() { return TypeFactory::getIntType(); }
    std::shared_ptr<Type> getVoidType() { return TypeFactory::getVoidType(); }
    
    // 数组类型创建
    std::shared_ptr<Type> getArrayType(std::shared_ptr<Type> elementType, uint64_t size) {
        return TypeFactory::getArrayType(elementType, size);
    }
    
    // 函数类型创建
    std::shared_ptr<Type> getFunctionType(std::shared_ptr<Type> returnType, const std::vector<std::shared_ptr<Type>>& paramTypes) {
        return TypeFactory::getFunctionType(returnType, paramTypes);
    }
    
    // 输出IR
    void dumpToFile(const std::string& filename);
    std::string getIRString();
    
    // 验证模块
    bool verifyModule();
};

