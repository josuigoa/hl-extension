# start of HashLink generic values
cmake_minimum_required(VERSION 3.1)

cmake_policy(SET CMP0042 NEW)

set(HDLL_DESTINATION
    ${CMAKE_INSTALL_LIBDIR}
)

# end of HashLink generic values

target_link_libraries(hlib.hdll
    libhl
)

install(
    TARGETS
        hlib.hdll
    DESTINATION ${HDLL_DESTINATION}
)
