set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

# Set the cross compiler paths
set(CMAKE_C_COMPILER /usr/bin/aarch64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER /usr/bin/aarch64-linux-gnu-g++)
set(CMAKE_ASM_COMPILER /usr/bin/aarch64-linux-gnu-as)

# Set the sysroot (optional, but recommended)
# set(CMAKE_SYSROOT /usr/aarch64-linux-gnu)
# set(CMAKE_FIND_ROOT_PATH /usr/aarch64-linux-gnu)

# Search for programs and libraries in the target directories only
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Set compilation flags
set(CMAKE_C_FLAGS "-march=armv8-a -mtune=cortex-a76" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "-march=armv8-a -mtune=cortex-a76" CACHE STRING "" FORCE)

# Linker settings (adjust if necessary)
# set(CMAKE_EXE_LINKER_FLAGS "--sysroot=${CMAKE_SYSROOT}")
# set(CMAKE_SHARED_LINKER_FLAGS "--sysroot=${CMAKE_SYSROOT}")
