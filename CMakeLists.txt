cmake_minimum_required(VERSION 3.24.2)
project(bl808_lp_blinky C ASM)

add_executable(blinky)

target_sources(blinky PRIVATE src/test.c src/startup.S src/vector_ch32v003.S)
set_target_properties(blinky PROPERTIES LINK_DEPENDS ${CMAKE_SOURCE_DIR}/src/bl808_lp.ld)
target_link_options(blinky PRIVATE -T ${CMAKE_SOURCE_DIR}/src/bl808_lp.ld)