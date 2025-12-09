#include "SymbolTable.h"
#include "Type.h"
#include "Value.h"

void SymbolTable::enterScope() {
    scopes.push_back(std::unordered_map<std::string, SymbolEntry*>());
}

void SymbolTable::leaveScope() {
    if (!scopes.empty()) {
        // 删除当前作用域的所有符号
        for (auto& entry : scopes.back()) {
            delete entry.second;
        }
        scopes.pop_back();
    }
}

bool SymbolTable::addSymbol(const std::string& name, std::shared_ptr<Type> type, Value* value, 
               bool isConst, bool isGlobal) {
    if (scopes.empty()) return false;
    
    auto& currentScope = scopes.back();
    if (currentScope.find(name) != currentScope.end()) {
        return false; // 符号已存在
    }
    
    currentScope[name] = new SymbolEntry(name, type, value, isConst, isGlobal);
    return true;
}

SymbolEntry* SymbolTable::lookup(const std::string& name) {
    // 从最内层作用域开始查找
    for (auto it = scopes.rbegin(); it != scopes.rend(); ++it) {
        auto found = it->find(name);
        if (found != it->end()) {
            return found->second;
        }
    }
    return nullptr;
}

SymbolEntry* SymbolTable::lookupInCurrentScope(const std::string& name) {
    if (scopes.empty()) return nullptr;
    auto found = scopes.back().find(name);
    return found != scopes.back().end() ? found->second : nullptr;
}

size_t SymbolTable::getCurrentScopeLevel() const {
    return scopes.size();
}
