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
        std::string result = name + ":\n";
        for (const auto& inst : instructions) {
            result += "    " + inst + "\n";
        }
        return result;
    }
    
    const std::string& getName() const { return name; }
};

