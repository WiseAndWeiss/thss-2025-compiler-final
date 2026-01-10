// include/Value.h
#pragma once

#include "Type.h"
#include <string>

class Value {
private:
    std::string name;
    std::shared_ptr<Type> type;
    
public:
    Value(const std::string& n, std::shared_ptr<Type> t) : name(n), type(t) {}
    virtual ~Value() = default;  // 添加虚析构函数，使类变成多态的
    
    std::string getName() const { return name; }
    std::shared_ptr<Type> getType() const { return type; }
    void setName(const std::string& n) { name = n; }
};
