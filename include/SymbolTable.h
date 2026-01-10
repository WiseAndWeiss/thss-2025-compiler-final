// include/SymbolTable.h
#pragma once

#include "Type.h"
#include "Value.h"
#include <string>
#include <vector>
#include <unordered_map>
#include <memory>

// 符号表条目
class SymbolEntry {
public:
    std::string name;
    std::shared_ptr<Type> type;
    Value* value;        // 对应的LLVM Value
    bool isConst;
    bool isGlobal;
    int constValue;      // 对于常量，存储其值（用于常量表达式计算）

    // SymbolEntry Implementation
    SymbolEntry(const std::string& name, std::shared_ptr<Type> type, Value* value, 
                bool isConst, bool isGlobal, int constValue = 0)
        : name(name), type(type), value(value), isConst(isConst), isGlobal(isGlobal), constValue(constValue) {}
};

// 符号表类
class SymbolTable {
private:
    std::vector<std::unordered_map<std::string, SymbolEntry*>> scopes;
    
public:
    // SymbolTable Implementation
    SymbolTable() { 
        enterScope(); // 进入全局作用域
    }

    ~SymbolTable() {
        // 清理所有符号条目
        for (auto& scope : scopes) {
            for (auto& entry : scope) {
                delete entry.second;
            }
        }
    }
    
    // 进入新作用域
    void enterScope();
    
    // 离开当前作用域
    void leaveScope();
    
    // 添加符号
    bool addSymbol(const std::string& name, std::shared_ptr<Type> type, Value* value = nullptr, 
                   bool isConst = false, bool isGlobal = false, int constValue = 0);
    
    // 查找符号（从内到外）
    SymbolEntry* lookup(const std::string& name);
    
    // 只在当前作用域查找
    SymbolEntry* lookupInCurrentScope(const std::string& name);
    
    // 获取当前作用域层级
    size_t getCurrentScopeLevel() const;
};
