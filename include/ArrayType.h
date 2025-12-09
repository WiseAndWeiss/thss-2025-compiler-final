#pragma once
#include <Type.h>

class ArrayType : public Type {
public:
    ArrayType(std::shared_ptr<Type> elementType, uint64_t elementCount, bool isConst = false)
        : Type(ArrayTypeID), elementType(elementType), 
          elementCount(elementCount), constFlag(isConst) {}
    
    std::string toString() const override {
        return "[" + std::to_string(elementCount) + " x " + elementType->toString() + "]";
    }
    
    std::shared_ptr<Type> getElementType() const { return elementType; }
    uint64_t getElementCount() const { return elementCount; }
    bool isConst() const override { return constFlag; }
    
    // 获取数组的总大小（字节数）
    uint64_t getSize() const {
        // 假设每个int为4字节，可根据实际情况调整
        uint64_t elementSize = 4; 
        if (auto innerArray = std::dynamic_pointer_cast<ArrayType>(elementType)) {
            elementSize = innerArray->getSize();
        }
        return elementCount * elementSize;
    }
    
private:
    std::shared_ptr<Type> elementType;
    uint64_t elementCount;
    bool constFlag;
};