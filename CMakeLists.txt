# CMakeLists.txt
cmake_minimum_required(VERSION 3.28)
project(HelloProject)

enable_testing()  # Enable CTest support

add_subdirectory(src/math)
add_subdirectory(src/utils)

add_executable(hello src/main.cpp)

# Link subdirectory libraries
target_link_libraries(hello math utils)

# Include their headers
target_include_directories(hello
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src/math
        ${CMAKE_CURRENT_SOURCE_DIR}/src/utils
)
# Add tests
add_subdirectory(tests)