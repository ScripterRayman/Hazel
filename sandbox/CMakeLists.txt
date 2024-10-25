cmake_minimum_required(VERSION 3.10)
project(Sandbox)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_OSX_ARCHITECTURES "arm64")

# Create the Sandbox executable
add_executable(Sandbox src/SandboxApp.cpp)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../Hazel/src/)

# Link against the Hazel library
target_link_libraries(Sandbox PRIVATE Hazel)

# Link against the Cocoa framework for macOS
if(APPLE)
    target_link_libraries(Sandbox PRIVATE "-framework Cocoa")
endif()
