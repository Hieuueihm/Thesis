cmake_minimum_required(VERSION 3.10)

project(mrelbp)

set(OpenCV_DIR C:/opencv/build/x64/vc15/lib)
find_package(OpenCV REQUIRED core imgproc highgui)
add_executable(${PROJECT_NAME} mrelbp.cpp)

target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBS})

