#!/bin/sh
set -e
BUILD_DIR=$(pwd)
PREFIX=${BUILD_DIR}"/usr/"

#check if compiler exists
clear

OE_PATH=/opt/toolchain/toolchains/mipsoe20/bin
printf "Set Compiler Path... '"${OE_PATH}"'\n\n"
export PATH=$PATH:$OE_PATH

HOST=mipsel-unknown-linux-gnu
GCC=${HOST}"-gcc"
GPP=${HOST}"-g++"
CC=${GCC}
CXX=${GPP}

CPPFLAGS="-mhard-float"

cd build

sleep 1

echo "[Hardfloat] Clean directory..."
make clean -i

echo "[Hardfloat] Configure..."
./configure CC=${CC} CXX=${CXX} --host=${HOST} CPPFLAGS="${CPPFLAGS}" --prefix=${PREFIX}


echo
echo "###############################################################"
echo "#                                                             #"
echo "#                        Build MIPS             	            #"
echo "#                                                             #"
echo "###############################################################"
echo ""
echo ""


echo "[Hardfloat] Make..."
make  -j2
make install

echo "[Hardfloat] >>>> Build Hard-FPU Finisched <<<<"

mv $PREFIX/bin/enigmalight $PREFIX/bin/enigmalight_mips



exit 0;
