cmake_minimum_required(VERSION 3.20.0)
project(lecture1 VERSION 0.1.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)                                         

set(CMAKE_CXX_EXTENSIONS OFF)                                                 
set(CMAKE_CXX_STANDARD_REQUIRED True)                                                                  
add_compile_options(-pedantic -Wall -Wextra -Werror) 

add_executable(lecture1 main.cpp)

