#include <iostream>
#include <fstream>
#include "antlr4-runtime.h"
#include "SysYLexer.h"
#include "SysYParser.h"
#include "SysYVisitor.h"
#include "LLVMContext.h"
#include "Module.h"

using namespace antlr4;

int main(int argc, const char *argv[]) {
  // 简单的参数解析
  // 期望格式: ./compiler <input> <output> 
  // 或者 ./compiler <input> -o <output>
  
  if (argc < 3) {
    std::cerr << "Usage: " << argv[0] << " <input-file> [-o] <output-file>" << std::endl;
    return 1;
  }

  std::string inputFileName = argv[1];
  std::string outputFileName;

  // 简单的参数处理逻辑
  if (std::string(argv[2]) == "-o") {
      if (argc < 4) {
          std::cerr << "Error: Output file missing after -o" << std::endl;
          return 1;
      }
      outputFileName = argv[3];
  } else {
      outputFileName = argv[2];
  }

  // 打开输入文件
  std::ifstream inputStream(inputFileName);
  if (!inputStream.is_open()) {
      std::cerr << "Error: Cannot open input file " << inputFileName << std::endl;
      return 1;
  }

  // ANTLR 解析
  ANTLRInputStream input(inputStream);
  SysYLexer lexer(&input);
  CommonTokenStream tokens(&lexer);
  SysYParser parser(&tokens);

  // 解析
  SysYParser::CompUnitContext* tree = parser.compUnit();

  // IR 生成
  LLVMContext context;
  SysYVisitor visitor(&context);
  visitor.visit(tree);

  // 输出
  std::ofstream outputStream(outputFileName);
  if (!outputStream.is_open()) {
      std::cerr << "Error: Cannot open output file " << outputFileName << std::endl;
      return 1;
  }

  outputStream << context.getModule()->toString();
  outputStream.close();

  return 0;
}