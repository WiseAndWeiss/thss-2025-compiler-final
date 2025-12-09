#pragma once
#include <Type.h>
#include <vector>

class FunctionType : public Type {
public:
    FunctionType(std::shared_ptr<Type> returnType, const std::vector<std::shared_ptr<Type>>& paramTypes)
        : Type(FunctionTypeID), returnType(returnType), paramTypes(paramTypes) {}
    
    std::string toString() const override {
        std::string result = returnType->toString() + " (";
        for (size_t i = 0; i < paramTypes.size(); ++i) {
            if (i > 0) result += ", ";
            result += paramTypes[i]->toString();
        }
        result += ")";
        return result;
    }
    
    std::shared_ptr<Type> getReturnType() const { return returnType; }
    const std::vector<std::shared_ptr<Type>>& getParamTypes() const { return paramTypes; }
    size_t getParamCount() const { return paramTypes.size(); }
    
private:
    std::shared_ptr<Type> returnType;
    std::vector<std::shared_ptr<Type>> paramTypes;
};