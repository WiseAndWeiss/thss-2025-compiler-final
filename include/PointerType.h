#pragma once
#include <Type.h>

class PointerType : public Type {
public:
    PointerType(std::shared_ptr<Type> pointedType) 
        : Type(PointerTypeID), pointedType(pointedType) {}
    
    std::string toString() const override {
        return pointedType->toString() + "*";
    }
    
    std::shared_ptr<Type> getPointedType() const { return pointedType; }
    
private:
    std::shared_ptr<Type> pointedType;
};