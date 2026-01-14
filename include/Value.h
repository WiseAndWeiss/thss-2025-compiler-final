// include/Value.h
#pragma once

#include "Type.h"
#include <string>
#include <stdlib.h>


class Value {
private:
    std::string name;
    std::shared_ptr<Type> type;
    std::string uniqueName;
    
public:
    Value(const std::string& n, std::shared_ptr<Type> t) : name(n), type(t), uniqueName(n) {}
    Value(const std::string& n, std::shared_ptr<Type> t, const std::string& un) : name(n), type(t), uniqueName(un) {}
    virtual ~Value() = default;  // 添加虚析构函数，使类变成多态的
    
    std::string getName() const { return name; }
    std::string getUniqueName() const { return uniqueName; }
    std::shared_ptr<Type> getType() const { return type; }
    void setName(const std::string& n) { name = n; }
};
