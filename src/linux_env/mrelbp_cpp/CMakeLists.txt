cmake_minimum_required(VERSION 3.14)
project(mrelbp)

set(CMAKE_CXX_STANDARD 14)


add_definitions ()

add_subdirectory(pybind11)
find_package(OpenCV REQUIRED)

pybind11_add_module(mrelbp main.cpp)
target_link_libraries(mrelbp PRIVATE ${OpenCV_LIBS})
