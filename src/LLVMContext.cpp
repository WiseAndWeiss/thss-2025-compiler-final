#include "LLVMContext.h"
#include "Module.h"
#include <fstream>

LLVMContext::LLVMContext(const std::string& moduleName) {
    module = std::make_unique<Module>(moduleName);
    builder = std::make_unique<IRBuilder>(module.get());
    symbolTable = std::make_unique<SymbolTable>();
}

LLVMContext::~LLVMContext() {
    // 智能指针会自动清理资源
}

void LLVMContext::dumpToFile(const std::string& filename) {
    std::ofstream outFile(filename);
    if (outFile.is_open()) {
        outFile << module->toString();
        outFile.close();
    }
}

std::string LLVMContext::getIRString() {
    return module->toString();
}

bool LLVMContext::verifyModule() {
    return true;
}
