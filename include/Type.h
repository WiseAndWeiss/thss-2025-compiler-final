#pragma once
#include <string>
#include <vector>
#include <memory>
#include <iostream>

// Forward declarations
class Type;
class IntType;
class VoidType;
class ArrayType;
class PointerType;
class FunctionType;

// Type Class
class Type {
public:
    enum TypeID {
        IntTypeID,
        VoidTypeID,
        ArrayTypeID,
        FunctionTypeID,
        PointerTypeID
    };
    
    Type(TypeID id) : typeID(id) {}
    virtual ~Type() = default;
    
    TypeID getTypeID() const { return typeID; }
    virtual std::string toString() const = 0;
    virtual bool isConst() const { return false; }
    
private:
    TypeID typeID;
};

// IntType Class
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

// VoidType Class
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

// ArrayType Class
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

// PointerType Class
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

// FunctionType Class
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

// TypeFactory Class
class TypeFactory {
public:
    // 基本类型获取
    static std::shared_ptr<IntType> getIntType() { return IntType::getInstance(); }
    static std::shared_ptr<VoidType> getVoidType() { return VoidType::getInstance(); }
    
    // 数组类型创建
    static std::shared_ptr<ArrayType> getArrayType(std::shared_ptr<Type> elementType, uint64_t elementCount, bool isConst = false) {
        // 可以添加缓存机制避免重复创建相同类型
        return std::make_shared<ArrayType>(elementType, elementCount, isConst);
    }
    
    // 函数类型创建
    static std::shared_ptr<FunctionType> getFunctionType(std::shared_ptr<Type> returnType, const std::vector<std::shared_ptr<Type>>& paramTypes) {
        return std::make_shared<FunctionType>(returnType, paramTypes);
    }
    
    // 指针类型创建
    static std::shared_ptr<PointerType> getPointerType(std::shared_ptr<Type> pointedType) {
        return std::make_shared<PointerType>(pointedType);
    }
    
    // 类型比较
    static bool isSameType(std::shared_ptr<Type> type1, std::shared_ptr<Type> type2) {
        if (type1->getTypeID() != type2->getTypeID()) return false;
        
        switch (type1->getTypeID()) {
            case Type::IntTypeID:
            case Type::VoidTypeID:
                return true;
                
            case Type::ArrayTypeID: {
                auto array1 = std::static_pointer_cast<ArrayType>(type1);
                auto array2 = std::static_pointer_cast<ArrayType>(type2);
                return array1->getElementCount() == array2->getElementCount() &&
                       isSameType(array1->getElementType(), array2->getElementType());
            }
                
            case Type::FunctionTypeID: {
                auto func1 = std::static_pointer_cast<FunctionType>(type1);
                auto func2 = std::static_pointer_cast<FunctionType>(type2);
                if (!isSameType(func1->getReturnType(), func2->getReturnType())) 
                    return false;
                if (func1->getParamCount() != func2->getParamCount()) 
                    return false;
                for (size_t i = 0; i < func1->getParamCount(); ++i) {
                    if (!isSameType(func1->getParamTypes()[i], func2->getParamTypes()[i]))
                        return false;
                }
                return true;
            }
                
            case Type::PointerTypeID: {
                auto ptr1 = std::static_pointer_cast<PointerType>(type1);
                auto ptr2 = std::static_pointer_cast<PointerType>(type2);
                return isSameType(ptr1->getPointedType(), ptr2->getPointedType());
            }
        }
        return false;
    }
};
