cmake_minimum_required(VERSION 3.0.0)
project(Jerasure VERSION 2.0)

include(CTest)
enable_testing()


set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

set(SRCS
  src/cauchy.c
  src/galois.c
  src/jerasure.c
  src/liberation.c
  src/reed_sol.c
  )

set (HEADERS
  include/jerasure.h
  include/cauchy.h
  include/galois.h
  include/liberation.h
  include/reed_sol.h
  )

include_directories(include ${GF_COMPLETE_HEADER_DIR})
add_library(Jerasure ${SRCS} ${HEADERS})

find_library(GF_COMPLETE_LIB gf_complete)
IF(NOT GF_COMPLETE_LIB)
  message(FATAL_ERROR, "gf_complete not found")
ENDIF()
target_link_libraries(Jerasure GF_COMPLETE_LIB)
