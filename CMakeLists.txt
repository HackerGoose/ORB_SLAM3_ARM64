# orb-slam3 CMakeLists.txt
cmake_minimum_required(VERSION 3.16.1)
project(orbslam3-arm64)
set (CMAKE_CXX_STANDARD 17)
include_directories(include include/CameraModels)
file(GLOB SRC_LIST "src/*.cc" "src/*.cpp" "src/CameraModels/*.cpp")
include_directories(.)

include_directories(Thirdparty)
SET(CMAKE_BUILD_RPATH_USE_ORIGIN TRUE)

# opencv
file(COPY ${CMAKE_SOURCE_DIR}/Thirdparty/opencv/build/ DESTINATION ${PROJECT_SOURCE_DIR}/build/external/opencv)
set(OpenCV_DIR ${PROJECT_SOURCE_DIR}/build/external/opencv)
find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})

# g2o
add_subdirectory(Thirdparty/g2o)
add_library(${PROJECT_NAME} SHARED ${SRC_LIST})
# target_link_libraries( ${PROJECT_NAME} log)
# Eigen
include_directories(Thirdparty/eigen/)
include_directories(Thirdparty/eigen/Eigen)
include_directories(Thirdparty/eigen/Eigen/src)
# Sophus
include_directories(Thirdparty/Sophus)

# Define the destination directory
set(LIB_DESTINATION ${CMAKE_BINARY_DIR}/libs)

# Create the destination directory
file(MAKE_DIRECTORY ${LIB_DESTINATION})

# Copy OpenSSL libraries
file(COPY ${CMAKE_SOURCE_DIR}/Thirdparty/openssl-3.4.0/libcrypto.so.3 DESTINATION ${LIB_DESTINATION})
file(COPY ${CMAKE_SOURCE_DIR}/Thirdparty/openssl-3.4.0/libssl.so.3 DESTINATION ${LIB_DESTINATION})

# Copy Boost libraries
file(COPY ${CMAKE_SOURCE_DIR}/Thirdparty/boost_1_87_0/install/lib/libboost_system.a DESTINATION ${LIB_DESTINATION})
file(COPY ${CMAKE_SOURCE_DIR}/Thirdparty/boost_1_87_0/install/lib/libboost_atomic.a DESTINATION ${LIB_DESTINATION})
file(COPY ${CMAKE_SOURCE_DIR}/Thirdparty/boost_1_87_0/install/lib/libboost_serialization.a DESTINATION ${LIB_DESTINATION})

# openssl
include_directories(Thirdparty/openssl-3.4.0/include)
add_library(crypto SHARED IMPORTED)
set_target_properties(crypto PROPERTIES IMPORTED_LOCATION ${LIB_DESTINATION}/libcrypto.so.3)
add_library(ssl SHARED IMPORTED)
set_target_properties(ssl PROPERTIES IMPORTED_LOCATION ${LIB_DESTINATION}/libssl.so.3)

# boost
include_directories(Thirdparty/boost_1_87_0/install/include)
add_library(boost_system STATIC IMPORTED)
set_target_properties(boost_system PROPERTIES IMPORTED_LOCATION        
${LIB_DESTINATION}/libboost_system.a)
add_library(boost_atomic STATIC IMPORTED)
set_target_properties(boost_atomic PROPERTIES IMPORTED_LOCATION        
${LIB_DESTINATION}/libboost_atomic.a)
add_library(boost_serialization STATIC IMPORTED)
set_target_properties(boost_serialization PROPERTIES IMPORTED_LOCATION        
${LIB_DESTINATION}/libboost_serialization.a)
set_target_properties(${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON)

target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBS} DBoW2 g2o crypto ssl boost_system boost_atomic boost_serialization)
# DBoW2
add_subdirectory(Thirdparty/DBoW2)
# set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples/Stereo-Inertial)

add_executable(stereo_inertial_euroc
        Examples/Stereo-Inertial/stereo_inertial_euroc.cc)
set_target_properties(stereo_inertial_euroc PROPERTIES POSITION_INDEPENDENT_CODE ON)

target_link_libraries(stereo_inertial_euroc ${PROJECT_NAME})
