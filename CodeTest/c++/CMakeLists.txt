cmake_minimum_required(VERSION 3.11)

project(mrelbp)
set(CMAKE_CXX_STANDARD 17)

set(OpenCV_DIR C:/opencv/build/x64/vc15/lib)

find_package(OpenCV REQUIRED core imgproc highgui imgcodecs)
add_executable(${PROJECT_NAME} mrelbp.cpp)

target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBS})

message(STATUS "OpenCV version: ${OpenCV_VERSION}")
message(STATUS "OpenCV include dirs: ${OpenCV_INCLUDE_DIRS}")
message(STATUS "OpenCV libraries: ${OpenCV_LIBS}")