#pragma once
#include <Type.h>

class IntType : public Type {
public:
    static std::shared_ptr<IntType> getInstance() {
        static std::shared_ptr<IntType> instance(new IntType());
        return instance;
    }
    
    std::string toString() const override {
        return "i32";  // LLVM IR中的32位整数
    }
    
private:
    IntType() : Type(IntTypeID) {}
};