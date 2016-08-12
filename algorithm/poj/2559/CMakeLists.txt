cmake_minimum_required(VERSION 3.6)
project(2559)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -DDEBUG")

set(SOURCE_FILES main.cpp)
add_executable(2559 ${SOURCE_FILES})