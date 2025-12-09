#pragma once
#include <Type.h>
#include <IntType.h>
#include <VoidType.h>
#include <ArrayType.h>
#include <FunctionType.h>
#include <PointerType.h>
#include <vector>
#include <memory>

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