#include "IRBuilder.h"
#include "Value.h"
#include "BasicBlock.h"
#include "Module.h"
#include "Type.h"
#include <sstream>
#include <regex>

// 辅助函数：格式化Value输出(常量和变量区分)
static std::string formatValue(Value* v) {
    std::string name = v->getName();
    // 简单判断是否为数字或布尔常量
    if (std::regex_match(name, std::regex("-?[0-9]+")) || name == "true" || name == "false") {
        return name;
    }
    return "%" + name;
}

// 常量创建
Value* IRBuilder::getInt32(int value) {
    // 简化实现：返回一个表示整数的Value
    return new Value(std::to_string(value), TypeFactory::getIntType());
}

Value* IRBuilder::getInt1(bool value) {
    return new Value(value ? "true" : "false", TypeFactory::getIntType()); // Should be i1 but using i32 for now or need Int1Type
}

// 内存操作
Value* IRBuilder::createAlloca(std::shared_ptr<Type> type, const std::string& name) {
    // 生成 alloca 指令
    // e.g: %name = alloca i32, align 4
    // 含义：在栈上分配一个i32类型的变量
    std::stringstream ss;
    ss << "%" << (name.empty() ? "temp" : name) << " = alloca " << type->toString() << ", align 4";
    addInstruction(ss.str());
    return new Value(name, type);
}

Value* IRBuilder::createStore(Value* value, Value* ptr) {
    // 生成 store 指令
    // e.g: store i32 %value, i32* %ptr, align 4
    // 含义：将 value 存储到 ptr 指向的内存位置
    std::stringstream ss;
    ss << "store " << value->getType()->toString() << " " << formatValue(value) 
       << ", " << ptr->getType()->toString() << "* " << formatValue(ptr) << ", align 4";
    addInstruction(ss.str());
    return nullptr; // store不返回值
}

Value* IRBuilder::createLoad(Value* ptr, const std::string& name) {
    // 生成 load 指令
    // e.g: %name = load i32, i32* %ptr, align 4
    // 含义：从 ptr 指向的内存位置加载一个值
    auto ptrType = std::dynamic_pointer_cast<PointerType>(ptr->getType());
    std::shared_ptr<Type> loadedType = ptrType ? ptrType->getPointedType() : TypeFactory::getIntType();

    std::stringstream ss;
    ss << "%" << (name.empty() ? "load_temp" : name) << " = load " 
       << loadedType->toString() << ", " << ptr->getType()->toString() << "* " << formatValue(ptr) << ", align 4";
    addInstruction(ss.str());
    return new Value(name, loadedType);
}

// 算术运算
Value* IRBuilder::createAdd(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 add 指令
    // e.g: %name = add i32 %lhs, %rhs
    // 含义：计算 lhs + rhs 的值
    std::stringstream ss;
    ss << "%" << (name.empty() ? "add_temp" : name) << " = add " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(name, lhs->getType());
}

Value* IRBuilder::createSub(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 sub 指令
    // e.g: %name = sub i32 %lhs, %rhs
    // 含义：计算 lhs - rhs 的值
    std::stringstream ss;
    ss << "%" << (name.empty() ? "sub_temp" : name) << " = sub " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(name, lhs->getType());
}

Value* IRBuilder::createMul(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 mul 指令
    // e.g: %name = mul i32 %lhs, %rhs
    // 含义：计算 lhs * rhs 的值
    std::stringstream ss;
    ss << "%" << (name.empty() ? "mul_temp" : name) << " = mul " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(name, lhs->getType());
}

Value* IRBuilder::createSDiv(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 sdiv 指令
    // e.g: %name = sdiv i32 %lhs, %rhs
    // 含义：计算 lhs / rhs 的值（有符号除法）
    std::stringstream ss;
    ss << "%" << (name.empty() ? "sdiv_temp" : name) << " = sdiv " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(name, lhs->getType());
}

Value* IRBuilder::createSRem(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 srem 指令
    // e.g: %name = srem i32 %lhs, %rhs
    // 含义：计算 lhs % rhs 的值（有符号取模）
    std::stringstream ss;
    ss << "%" << (name.empty() ? "srem_temp" : name) << " = srem " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(name, lhs->getType());
}

Value* IRBuilder::createICmpEQ(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 icmp eq 指令
    // e.g: %name = icmp eq i32 %lhs, %rhs
    // 含义：比较 lhs 和 rhs 是否相等
    std::stringstream ss;
    ss << "%" << (name.empty() ? "icmp_eq_temp" : name) << " = icmp eq " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(name, TypeFactory::getIntType()); 
}

Value* IRBuilder::createICmpNE(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 icmp ne 指令
    // e.g: %name = icmp ne i32 %lhs, %rhs
    // 含义：比较 lhs 和 rhs 是否不等
    std::stringstream ss;
    ss << "%" << (name.empty() ? "icmp_ne_temp" : name) << " = icmp ne " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(name, TypeFactory::getIntType()); 
}

Value* IRBuilder::createICmpSLT(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 icmp slt 指令
    // e.g: %name = icmp slt i32 %lhs, %rhs
    // 含义：比较 lhs 是否小于 rhs（有符号）
    std::stringstream ss;
    ss << "%" << (name.empty() ? "icmp_slt_temp" : name) << " = icmp slt " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(name, TypeFactory::getIntType()); 
}

Value* IRBuilder::createICmpSLE(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 icmp sle 指令
    // e.g: %name = icmp sle i32 %lhs, %rhs
    // 含义：比较 lhs 是否小于等于 rhs（有符号）
    std::stringstream ss;
    ss << "%" << (name.empty() ? "icmp_sle_temp" : name) << " = icmp sle " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(name, TypeFactory::getIntType()); 
}

Value* IRBuilder::createICmpSGT(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 icmp sgt 指令
    // e.g: %name = icmp sgt i32 %lhs, %rhs
    // 含义：比较 lhs 是否大于 rhs（有符号）
    std::stringstream ss;
    ss << "%" << (name.empty() ? "icmp_sgt_temp" : name) << " = icmp sgt " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(name, TypeFactory::getIntType()); 
}

Value* IRBuilder::createICmpSGE(Value* lhs, Value* rhs, const std::string& name) {
    // 生成 icmp sge 指令
    // e.g: %name = icmp sge i32 %lhs, %rhs
    // 含义：比较 lhs 是否大于等于 rhs（有符号）
    std::stringstream ss;
    ss << "%" << (name.empty() ? "icmp_sge_temp" : name) << " = icmp sge " 
       << lhs->getType()->toString() << " " << formatValue(lhs) << ", " << formatValue(rhs);
    addInstruction(ss.str());
    return new Value(name, TypeFactory::getIntType()); 
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
    // 含义：调用函数 callee 并传递参数 args
    std::stringstream ss;
    ss << "%" << (name.empty() ? "call_temp" : name) << " = call " 
       << std::static_pointer_cast<FunctionType>(callee->getType())->getReturnType()->toString()
       << " @" << callee->getName() << "(";
    for (size_t i = 0; i < args.size(); ++i) {
        if (i > 0) ss << ", ";
        ss << args[i]->getType()->toString() << " " << formatValue(args[i]);
    }
    ss << ")";
    addInstruction(ss.str());
    return new Value(name, std::static_pointer_cast<FunctionType>(callee->getType())->getReturnType());
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

Value* IRBuilder::createZExt(Value* value, std::shared_ptr<Type> destType, const std::string& name) { return nullptr; }
Value* IRBuilder::createSExt(Value* value, std::shared_ptr<Type> destType, const std::string& name) { return nullptr; }
Value* IRBuilder::createTrunc(Value* value, std::shared_ptr<Type> destType, const std::string& name) { return nullptr; }

void IRBuilder::addInstruction(const std::string& instruction) {
    // 简化实现：将指令添加到当前基本块
    if (currentBB) {
        currentBB->addInstruction(instruction);
    }
}


