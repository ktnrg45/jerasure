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

add_library(Jerasure ${SRCS} ${HEADERS})

set (GF_COMPLETE_DIR "gf-complete")

add_subdirectory(${GF_COMPLETE_DIR})
target_include_directories(Jerasure PUBLIC include ${GF_COMPLETE_DIR}/include)
target_link_libraries(Jerasure PUBLIC gf_complete)
