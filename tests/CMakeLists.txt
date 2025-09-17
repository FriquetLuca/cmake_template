add_executable(tests
    test_add.cpp
    catch_amalgamated.cpp  # Add this line
)

target_link_libraries(tests PRIVATE math)

target_include_directories(tests PRIVATE
    ${CMAKE_SOURCE_DIR}/src/math
    ${CMAKE_CURRENT_SOURCE_DIR}
)

# Use generator expression to locate the built binary
add_test(NAME UnitTests COMMAND $<TARGET_FILE:tests>)