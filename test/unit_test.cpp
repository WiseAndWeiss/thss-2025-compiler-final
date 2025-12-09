#include <gtest/gtest.h>
#include "Type.h"
#include "SymbolTable.h"
#include "IRBuilder.h"
#include "Module.h"
#include "BasicBlock.h"

// --- Type System Tests ---

TEST(TypeTest, IntTypeSingleton) {
    auto t1 = TypeFactory::getIntType();
    auto t2 = TypeFactory::getIntType();
    EXPECT_EQ(t1, t2);
    EXPECT_EQ(t1->toString(), "i32");
}

TEST(TypeTest, VoidTypeSingleton) {
    auto t1 = TypeFactory::getVoidType();
    auto t2 = TypeFactory::getVoidType();
    EXPECT_EQ(t1, t2);
    EXPECT_EQ(t1->toString(), "void");
}

TEST(TypeTest, ArrayType) {
    auto intType = TypeFactory::getIntType();
    auto arrayType = TypeFactory::getArrayType(intType, 10);
    EXPECT_EQ(arrayType->toString(), "[10 x i32]");
    EXPECT_EQ(arrayType->getElementCount(), 10);
    EXPECT_TRUE(TypeFactory::isSameType(arrayType->getElementType(), intType));
}

TEST(TypeTest, FunctionType) {
    auto intType = TypeFactory::getIntType();
    auto voidType = TypeFactory::getVoidType();
    std::vector<std::shared_ptr<Type>> params = {intType, intType};
    auto funcType = TypeFactory::getFunctionType(voidType, params);
    
    EXPECT_EQ(funcType->toString(), "void (i32, i32)");
    EXPECT_EQ(funcType->getParamCount(), 2);
}

// --- Symbol Table Tests ---

TEST(SymbolTableTest, BasicOperations) {
    SymbolTable st;
    st.enterScope();
    
    auto intType = TypeFactory::getIntType();
    Value* val = new Value("a", intType);
    
    st.addSymbol("a", intType, val);
    auto entry = st.lookup("a");
    
    ASSERT_NE(entry, nullptr);
    EXPECT_EQ(entry->name, "a");
    EXPECT_EQ(entry->value, val);
    
    st.leaveScope();
}

TEST(SymbolTableTest, ScopeShadowing) {
    SymbolTable st;
    st.enterScope(); // Global
    
    st.addSymbol("x", TypeFactory::getIntType(), nullptr);
    
    st.enterScope(); // Local
    st.addSymbol("x", TypeFactory::getVoidType(), nullptr);
    
    auto entry = st.lookup("x");
    EXPECT_EQ(entry->type->toString(), "void");
    
    st.leaveScope(); // Back to Global
    entry = st.lookup("x");
    EXPECT_EQ(entry->type->toString(), "i32");
}

// --- IR Generation Tests ---

TEST(IRBuilderTest, BasicBlockGeneration) {
    Module module("test_module");
    IRBuilder builder(&module);
    
    // Create Function
    auto funcType = TypeFactory::getFunctionType(TypeFactory::getVoidType(), {});
    Function* func = new Function("test_func", funcType);
    module.addFunction(func);
    
    // Create BasicBlock
    BasicBlock* bb = new BasicBlock("entry");
    func->addBasicBlock(bb);
    builder.setInsertPoint(bb);
    
    // Generate Instructions
    auto i32 = TypeFactory::getIntType();
    Value* a = builder.createAlloca(i32, "a");
    Value* const1 = builder.getInt32(1);
    builder.createStore(const1, a);
    Value* loaded = builder.createLoad(a, "val");
    builder.createRet(nullptr);
    
    // Verify Output String (Simple check)
    std::string ir = module.toString();
    EXPECT_NE(ir.find("define void @test_func()"), std::string::npos);
    EXPECT_NE(ir.find("entry:"), std::string::npos);
    EXPECT_NE(ir.find("%a = alloca i32, align 4"), std::string::npos);
    EXPECT_NE(ir.find("store i32 1, i32* %a, align 4"), std::string::npos);
    EXPECT_NE(ir.find("ret void"), std::string::npos);
}

TEST(IRBuilderTest, ArithmeticOperations) {
    Module module("test_module");
    IRBuilder builder(&module);
    
    auto funcType = TypeFactory::getFunctionType(TypeFactory::getVoidType(), {});
    Function* func = new Function("test_arith", funcType);
    module.addFunction(func);
    BasicBlock* bb = new BasicBlock("entry");
    func->addBasicBlock(bb);
    builder.setInsertPoint(bb);
    
    Value* a = builder.getInt32(10);
    Value* b = builder.getInt32(20);
    
    // Test constant arithmetic
    builder.createAdd(a, b, "add_res");
    
    // Test register arithmetic
    Value* x = builder.createAlloca(TypeFactory::getIntType(), "x");
    Value* loadedX = builder.createLoad(x, "val_x");
    builder.createAdd(loadedX, b, "add_reg");
    
    std::string ir = module.toString();
    // add i32 10, 20
    EXPECT_NE(ir.find("add i32 10, 20"), std::string::npos);
    // add i32 %val_x, 20
    EXPECT_NE(ir.find("add i32 %val_x, 20"), std::string::npos);
}
