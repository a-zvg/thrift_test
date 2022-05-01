project(client)

macro(GENERATE FILENAME)
    execute_process(COMMAND ${CMAKE_BINARY_DIR}/bin/thrift --gen py -o ${CMAKE_CURRENT_BINARY_DIR}
                    ${CMAKE_CURRENT_SOURCE_DIR}/${FILENAME} RESULT_VARIABLE CMD_RESULT)
    if(CMD_RESULT)
        message(FATAL_ERROR "Error generating ${FILENAME}")
    endif()
endmacro(GENERATE)

generate(../server/shared.thrift)
generate(../server/tutorial.thrift)
