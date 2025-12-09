cmake_minimum_required(VERSION 3.10)
project(compiler LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)

# Disable ANTLR4 tests to avoid downloading googletest twice or failing
set(ANTLR_BUILD_CPP_TESTS OFF CACHE BOOL "" FORCE)

# Include antlr4 runtime
add_subdirectory(third_party/antlr4-runtime)

# Headers for include
include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}/third_party/antlr4-runtime/runtime/src
    ${CMAKE_CURRENT_SOURCE_DIR}/src/antlr
)

# Generate executable files
file(GLOB SRC_FILES
    src/*.cpp
    src/antlr/*.cpp
)

add_executable(compiler ${SRC_FILES})

# Link runtime
target_link_libraries(compiler antlr4_shared)

# Set up Google Test
# include(FetchContent)
# FetchContent_Declare(
#   googletest
#   URL https://gh-proxy.com/https://github.com/google/googletest/archive/03597a01ee50ed33e9fd716149c63099179ad6c5.zip
# )

# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
# FetchContent_MakeAvailable(googletest)

# Use local googletest
add_subdirectory(third_party/googletest)

# Add test executable
enable_testing()

# Filter out main.cpp for testing
list(FILTER SRC_FILES EXCLUDE REGEX "src/main.cpp")

message(STATUS "Source files for unit_tests: ${SRC_FILES}")

add_executable(
  unit_tests
  ${CMAKE_CURRENT_SOURCE_DIR}/test/unit_test.cpp
  ${SRC_FILES}
)

target_link_libraries(
  unit_tests
  gtest_main
  antlr4_shared
)

include(GoogleTest)
gtest_discover_tests(unit_tests)

# Config ASAN
option(ENABLE_ASAN "Enable AddressSanitizer" OFF)

if(ENABLE_ASAN)
    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
        add_compile_options(-fsanitize=address -fno-omit-frame-pointer)
        add_link_options(-fsanitize=address)
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        add_compile_options(/fsanitize=address)
    endif()
endif()