#include "IRBuilder.h"
#include "Value.h"
#include "BasicBlock.h"
#include "Module.h"
#include "Type.h"
#include <sstream>
#include <regex>

// 辅助函数：格式化Value输出(常量和变量区分)
static std::string formatValue(Value* v) {
    if (!v) return "null";
    std::string name = v->getName();
    // 简单判断是否为数字或布尔常量
    if (std::regex_match(name, std::regex("-?[0-9]+")) || name == "true" || name == "false") {
        return name;
    }
    return "%" + name;
}

// 辅助函数：格式化指针值（用于 load/store 指令，区分全局变量和局部变量）
static std::string formatPtrValue(Value* v) {
    if (!v) return "null";
    std::string name = v->getName();
    // 如果是数字常量，直接返回
    if (std::regex_match(name, std::regex("-?[0-9]+")) || name == "true" || name == "false") {
        return name;
    }
    // 尝试 dynamic_cast 检查是否是 GlobalVariable
    GlobalVariable* gvar = dynamic_cast<GlobalVariable*>(v);
    if (gvar) {
        return "@" + name;
    }
    return "%" + name;
}

// 常量创建
Value* IRBuilder::getInt32(int value) {
    // 简化实现：返回一个表示整数的Value
    return new Value(std::to_string(value), TypeFactory::getIntType());
}

Value* IRBuilder::getInt1(bool value) {
    return new Value(value ? "1" : "0", TypeFactory::getInt1Type());
}

// 内存操作
Value* IRBuilder::createAlloca(std::shared_ptr<Type> type, const std::string& name) {
    // 生成 alloca 指令
    // e.g: %name = alloca i32, align 4
    // 含义：在栈上分配一个i32类型的变量
    // alloca 返回的是指针类型，所以需要创建指针类型
    std::string actualName = name.empty() ? "temp" : name;
    std::stringstream ss;
    ss << "%" << actualName << " = alloca " << type->toString() << ", align 4";
    addInstruction(ss.str());
    // alloca 返回的是指针类型
    auto ptrType = TypeFactory::getPointerType(type);
    return new Value(actualName, ptrType);
}

Value* IRBuilder::createStore(Value* value, Value* ptr) {
    // 生成 store 指令
    // e.g: store i32 %value, i32* %ptr, align 4
    // 含义：将 value 存储到 ptr 指向的内存位置
    std::stringstream ss;
    // ptr 的类型应该已经是指针类型了，直接使用
    ss << "store " << value->getType()->toString() << " " << formatValue(value) 
       << ", " << ptr->getType()->toString() << " " << formatPtrValue(ptr) << ", align 4";
    addInstruction(ss.str());
    return nullptr; // store不返回值
}

Value* IRBuilder::createGEP(Value* ptr, const std::vector<Value*>& indices, const std::string& name) {
    // 生成 getelementptr 指令
    // e.g: %name = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %ptr, i32 0, i32 %idx1, i32 %idx2
    // 含义：计算数组元素的地址
    if (indices.empty()) {
        return ptr;
    }
    
    std::string actualName = name.empty() ? generateTempName("gep_temp") : name;
    std::stringstream ss;
    
    // 获取指针指向的类型
    auto ptrType = std::dynamic_pointer_cast<PointerType>(ptr->getType());
    std::shared_ptr<Type> elementType = ptrType ? ptrType->getPointedType() : TypeFactory::getIntType();
    
    ss << "%" << actualName << " = getelementptr " << elementType->toString() << ", " 
       << ptr->getType()->toString() << " " << formatPtrValue(ptr);
    
    // 第一个索引通常是0（从数组开始）
    ss << ", i32 0";
    
    // 后续索引
    for (auto idx : indices) {
        ss << ", i32 " << formatValue(idx);
    }
    
    addInstruction(ss.str());
    
    // GEP 返回的是指针类型，指向最终的元素类型
    // 需要根据索引计算最终的元素类型
    std::shared_ptr<Type> finalType = elementType;
    for (size_t i = 0; i < indices.size(); ++i) {
        if (auto arrayType = std::dynamic_pointer_cast<ArrayType>(finalType)) {
            finalType = arrayType->getElementType();
        } else {
            break;
        }
    }
    
    auto resultPtrType = TypeFactory::getPointerType(finalType);
    return new Value(actualName, resultPtrType);
}

Value* IRBuilder::createLoad(Value* ptr, const std::string& name) {
    // 生成 load 指令
    // e.g: %name = load i32, i32* %ptr, align 4
    // 含义：从 ptr 指向的内存位置加载一个值
    auto ptrType = std::dynamic_pointer_cast<PointerType>(ptr->getType());
    std::shared_ptr<Type> loadedType = ptrType ? ptrType->getPointedType() : TypeFactory::getIntType();

    std::string actualName = name.empty() ? generateTempName("load_temp") : name;
    std::stringstream ss;
    
    // 检查是否是全局变量
    GlobalVariable* gvar = dynamic_cast<GlobalVariable*>(ptr);
    if (gvar) {
        // 全局变量：load i32, i32* @name (注意：@name的类型已经是i32*，不需要再加*)
        ss << "%" << actualName << " = load " 
           << loadedType->toString() << ", " << ptr->getType()->toString() << " " << formatPtrValue(ptr) << ", align 4";
    } else {
        // 局部变量：load i32, i32* %name
        ss << "%" << actualName << " = load " 
           << loadedType->toString() << ", " << ptr->getType()->toString() << " " << formatPtrValue(ptr) << ", align 4";
    }
    addInstruction(ss.str());
    return new Value(actualName, loadedType);
}

// 算术运算
Value* IRBuilder::createAdd(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 add 指令
    // e.g: %name = add i32 %lhs, %rhs
    // 含义：计算 lhs + rhs 的值
    std::string actualName = name.empty() ? generateTempName("add_temp") : name;
    std::stringstream ss;
    ss << "%" << actualName << " = add " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(actualName, lhs->getType());
}

Value* IRBuilder::createSub(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 sub 指令
    // e.g: %name = sub i32 %lhs, %rhs
    // 含义：计算 lhs - rhs 的值
    std::string actualName = name.empty() ? generateTempName("sub_temp") : name;
    std::stringstream ss;
    ss << "%" << actualName << " = sub " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(actualName, lhs->getType());
}

Value* IRBuilder::createMul(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 mul 指令
    // e.g: %name = mul i32 %lhs, %rhs
    // 含义：计算 lhs * rhs 的值
    std::string actualName = name.empty() ? generateTempName("mul_temp") : name;
    std::stringstream ss;
    ss << "%" << actualName << " = mul " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(actualName, lhs->getType());
}

Value* IRBuilder::createSDiv(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 sdiv 指令
    // e.g: %name = sdiv i32 %lhs, %rhs
    // 含义：计算 lhs / rhs 的值（有符号除法）
    std::string actualName = name.empty() ? generateTempName("sdiv_temp") : name;
    std::stringstream ss;
    ss << "%" << actualName << " = sdiv " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(actualName, lhs->getType());
}

Value* IRBuilder::createSRem(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 srem 指令
    // e.g: %name = srem i32 %lhs, %rhs
    // 含义：计算 lhs % rhs 的值（有符号取模）
    std::string actualName = name.empty() ? generateTempName("srem_temp") : name;
    std::stringstream ss;
    ss << "%" << actualName << " = srem " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(actualName, lhs->getType());
}

Value* IRBuilder::createICmpEQ(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 icmp eq 指令
    // e.g: %name = icmp eq i32 %lhs, %rhs
    // 含义：比较 lhs 和 rhs 是否相等
    std::string actualName = name.empty() ? generateTempName("icmp_eq_temp") : name;
    std::stringstream ss;
    ss << "%" << actualName << " = icmp eq " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(actualName, TypeFactory::getInt1Type()); 
}

Value* IRBuilder::createICmpNE(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 icmp ne 指令
    // e.g: %name = icmp ne i32 %lhs, %rhs
    // 含义：比较 lhs 和 rhs 是否不等
    std::string actualName = name.empty() ? generateTempName("icmp_ne_temp") : name;
    std::stringstream ss;
    ss << "%" << actualName << " = icmp ne " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(actualName, TypeFactory::getInt1Type()); 
}

Value* IRBuilder::createICmpSLT(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 icmp slt 指令
    // e.g: %name = icmp slt i32 %lhs, %rhs
    // 含义：比较 lhs 是否小于 rhs（有符号）
    std::string actualName = name.empty() ? generateTempName("icmp_slt_temp") : name;
    std::stringstream ss;
    ss << "%" << actualName << " = icmp slt " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(actualName, TypeFactory::getInt1Type()); 
}

Value* IRBuilder::createICmpSLE(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 icmp sle 指令
    // e.g: %name = icmp sle i32 %lhs, %rhs
    // 含义：比较 lhs 是否小于等于 rhs（有符号）
    std::string actualName = name.empty() ? generateTempName("icmp_sle_temp") : name;
    std::stringstream ss;
    ss << "%" << actualName << " = icmp sle " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(actualName, TypeFactory::getInt1Type()); 
}

Value* IRBuilder::createICmpSGT(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 icmp sgt 指令
    // e.g: %name = icmp sgt i32 %lhs, %rhs
    // 含义：比较 lhs 是否大于 rhs（有符号）
    std::string actualName = name.empty() ? generateTempName("icmp_sgt_temp") : name;
    std::stringstream ss;
    ss << "%" << actualName << " = icmp sgt " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(actualName, TypeFactory::getInt1Type()); 
}

Value* IRBuilder::createICmpSGE(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 icmp sge 指令
    // e.g: %name = icmp sge i32 %lhs, %rhs
    // 含义：比较 lhs 是否大于等于 rhs（有符号）
    std::string actualName = name.empty() ? generateTempName("icmp_sge_temp") : name;
    std::stringstream ss;
    ss << "%" << actualName << " = icmp sge " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(actualName, TypeFactory::getInt1Type()); 
}

void IRBuilder::createBr(BasicBlock* target) {
    // 生成 br 指令
    // e.g: br label %target
    // 含义：无条件跳转到目标基本块
    std::stringstream ss;
    ss << "br label %" << target->getName();
    addInstruction(ss.str());
}

void IRBuilder::createCondBr(Value* cond, BasicBlock* trueBB, BasicBlock* falseBB) {
    // 生成 cond br 指令
    // e.g: br i1 %cond, label %trueBB, label %falseBB
    // 含义：根据条件 cond 决定跳转到 trueBB 还是 falseBB
    std::stringstream ss;
    ss << "br i1 " << formatValue(cond) << ", label %" << trueBB->getName() 
       << ", label %" << falseBB->getName();
    addInstruction(ss.str());
}
Value* IRBuilder::createCall(Function* callee, const std::vector<Value*>& args, const std::string& name) {
    // 生成 call 指令
    // e.g: %name = call i32 @callee(i32 %arg1, i32 %arg2)
    // 或者: call void @callee(i32 %arg1, i32 %arg2) (对于 void 函数)
    // 含义：调用函数 callee 并传递参数 args
    auto returnType = std::static_pointer_cast<FunctionType>(callee->getType())->getReturnType();
    std::stringstream ss;
    
    if (returnType->toString() == "void") {
        // void 函数调用：call void @func(...)
        ss << "call void @" << callee->getName() << "(";
        for (size_t i = 0; i < args.size(); ++i) {
            if (i > 0) ss << ", ";
            ss << args[i]->getType()->toString() << " " << formatValue(args[i]);
        }
        ss << ")";
        addInstruction(ss.str());
        return nullptr;  // void 函数调用不返回值
    } else {
        // 非 void 函数调用：%name = call i32 @func(...)
        std::string actualName = name.empty() ? generateTempName("call_temp") : name;
        ss << "%" << actualName << " = call " 
           << returnType->toString()
           << " @" << callee->getName() << "(";
        for (size_t i = 0; i < args.size(); ++i) {
            if (i > 0) ss << ", ";
            ss << args[i]->getType()->toString() << " " << formatValue(args[i]);
        }
        ss << ")";
        addInstruction(ss.str());
        return new Value(actualName, returnType);
    }
}

void IRBuilder::createRet(Value* retValue) {
    // 生成 ret 指令
    // e.g: ret i32 %retValue / ret void
    // 含义：函数返回
    std::stringstream ss;
    if (retValue) {
        ss << "ret " << retValue->getType()->toString() << " " << formatValue(retValue);
    } else {
        ss << "ret void";
    }
    addInstruction(ss.str());
}

Value* IRBuilder::createZExt(Value* value, std::shared_ptr<Type> destType, const std::string& name) {
    // 生成 zext 指令（零扩展）
    // e.g: %name = zext i1 %value to i32
    std::string actualName = name.empty() ? generateTempName("zext_temp") : name;
    std::stringstream ss;
    ss << "%" << actualName << " = zext " << value->getType()->toString() << " " 
       << formatValue(value) << " to " << destType->toString();
    addInstruction(ss.str());
    return new Value(actualName, destType);
}

Value* IRBuilder::createSExt(Value* value, std::shared_ptr<Type> destType, const std::string& name) {
    // 生成 sext 指令（符号扩展）
    // e.g: %name = sext i1 %value to i32
    std::string actualName = name.empty() ? generateTempName("sext_temp") : name;
    std::stringstream ss;
    ss << "%" << actualName << " = sext " << value->getType()->toString() << " " 
       << formatValue(value) << " to " << destType->toString();
    addInstruction(ss.str());
    return new Value(actualName, destType);
}

Value* IRBuilder::createTrunc(Value* value, std::shared_ptr<Type> destType, const std::string& name) {
    // 生成 trunc 指令（截断）
    // e.g: %name = trunc i32 %value to i1
    std::string actualName = name.empty() ? generateTempName("trunc_temp") : name;
    std::stringstream ss;
    ss << "%" << actualName << " = trunc " << value->getType()->toString() << " " 
       << formatValue(value) << " to " << destType->toString();
    addInstruction(ss.str());
    return new Value(actualName, destType);
}

Value* IRBuilder::createGlobalVariable(const std::string& name, std::shared_ptr<Type> type, 
                                       Value* initializer, bool isConst) {
    // 创建全局变量
    auto ptrType = TypeFactory::getPointerType(type);
    GlobalVariable* gvar = new GlobalVariable(name, ptrType, initializer, isConst);
    if (module) {
        module->addGlobalVariable(gvar);
    }
    return gvar;
}

void IRBuilder::addInstruction(const std::string& instruction) {
    // 简化实现：将指令添加到当前基本块
    if (currentBB) {
        currentBB->addInstruction(instruction);
    }
}

std::string IRBuilder::generateTempName(const std::string& prefix) {
    return prefix + std::to_string(tempCounter++);
}


