project (mecheye_cpp_interface-1.0.0)
cmake_minimum_required(VERSION 3.5)

include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
if(COMPILER_SUPPORTS_CXX11)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
elseif(COMPILER_SUPPORTS_CXX0X)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
else()
    message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif()

set(CMAKE_VERBOSE_MAKEFILE on)
set(CMAKE_CXX_COMPILER $ENV{CXX})

find_package(PCL)
find_package(OpenCV)
find_package(Eigen3)
find_package(Boost)
find_package(PkgConfig)

include_directories(
    include
    /usr/include/jsoncpp
    <libzmq folder path>/include
    ${PCL_INCLUDE_DIRS}
    ${OpenCV_INCLUDE_DIRS}
    ${ZMQ_INCLUDE_DIRS}
    ${EIGEN_INCLUDE_DIRS}
    ${BOOST_INCLUDE_DIRS}
    )
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR})

aux_source_directory(src SRC_LIST)
add_executable(start ${SRC_LIST})
target_link_libraries(start
    ${PCL_LIBRARIES}
    ${OpenCV_LIBS}
    ${ZMQ_LIBRARIES}
    ${EIGEN_LIBRARIES}
    ${BOOST_LIBRARIES}
    <libzmq folder path>/lib/libzmq.so
    )
