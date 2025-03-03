rm -rf build
mkdir build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE="arm64cc.cmake" -S..
make
