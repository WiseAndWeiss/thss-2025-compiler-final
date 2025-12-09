#pragma once
#include <Type.h>

class VoidType : public Type {
public:
    static std::shared_ptr<VoidType> getInstance() {
        static std::shared_ptr<VoidType> instance(new VoidType());
        return instance;
    }
    
    std::string toString() const override {
        return "void";
    }
    
private:
    VoidType() : Type(VoidTypeID) {}
};