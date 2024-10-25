cmake_minimum_required(VERSION 3.10)
project(Hazel VERSION 1.0.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_OSX_ARCHITECTURES "arm64")

# Create a shared library
add_library(${PROJECT_NAME} SHARED src/Hazel/Application.cpp)
target_compile_definitions(${PROJECT_NAME} PRIVATE BUILD_DLL)  # Define BUILD_DLL for this target

# Include directory
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)

# Link Cocoa framework only for macOS
if(APPLE)
    target_link_libraries(${PROJECT_NAME} PRIVATE "-framework Cocoa")
endif()
