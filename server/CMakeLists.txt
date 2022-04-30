project(server)

macro(GENERATE FILENAME)
    execute_process(COMMAND ${CMAKE_BINARY_DIR}/bin/thrift --gen cpp:no_skeleton -o ${CMAKE_CURRENT_BINARY_DIR}
                    ${CMAKE_CURRENT_SOURCE_DIR}/${FILENAME} RESULT_VARIABLE CMD_RESULT)
    if(CMD_RESULT)
        message(FATAL_ERROR "Error generating ${FILENAME}")
    endif()
endmacro(GENERATE)

generate(shared.thrift)
generate(tutorial.thrift)

file(GLOB SRC ${CMAKE_CURRENT_BINARY_DIR}/gen-cpp/*.cpp
              src/*.cpp)

add_executable(${PROJECT_NAME} ${SRC})
target_link_libraries(${PROJECT_NAME} ${thrift_LIBRARIES})
