// include/BasicBlock.h
#pragma once

#include <string>
#include <vector>

class BasicBlock {
private:
    std::string name;
    std::vector<std::string> instructions;
    
public:
    BasicBlock(const std::string& n) : name(n) {}
    
    void addInstruction(const std::string& instruction) {
        instructions.push_back(instruction);
    }
    
    bool isTerminated() const {
        if (instructions.empty()) return false;
        const std::string& last = instructions.back();
        return last.find("ret ") == 0 || last.find("br ") == 0;
    }

    std::string toString() const {
        // 基本块必须至少有一个标签，即使它是空的
        // 在 LLVM IR 中，如果一个基本块被引用，它必须存在
        std::string result = name + ":\n";
        for (const auto& inst : instructions) {
            result += "    " + inst + "\n";
        }
        return result;
    }
    
    const std::string& getName() const { return name; }
};

