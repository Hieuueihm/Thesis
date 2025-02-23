cmake_minimum_required(VERSION 3.11)

project(mrelbp)
set(CMAKE_CXX_STANDARD 14)

set(OpenCV_DIR /usr/local/include/opencv4)

find_package(OpenCV REQUIRED)

include_directories( ${OpenCV_INCLUDE_DIRS})
add_executable(${PROJECT_NAME} mrelbp.cpp)

target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBS})

message(STATUS "OpenCV version: ${OpenCV_VERSION}")
message(STATUS "OpenCV include dirs: ${OpenCV_INCLUDE_DIRS}")
message(STATUS "OpenCV libraries: ${OpenCV_LIBS}")