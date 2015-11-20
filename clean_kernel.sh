#!/bin/bash
###############################################################################
#
#                           Kernel Clean Script 
#
###############################################################################
# 2015-09-07 mifl         : modified for clean mkbootimg dir
# 2011-10-24 effectivesky : modified
# 2010-12-29 allydrop     : created
###############################################################################

###############################################################################
# set toolchain
###############################################################################

export ARCH=arm
export PATH=$(pwd)/../../../prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin:$PATH
export CROSS_COMPILE=arm-eabi-

###############################################################################
# Clean: boot.img, dt.img, zImage and obj dir
###############################################################################

make mrproper
make O=./obj/KERNEL_OBJ/ clean

if [ -f ./mkbootimg/*/boot.img ]
then
    rm ./mkbootimg/*/boot.img
fi

if [ -f ./mkbootimg/*/zImage ]
then
    rm ./mkbootimg/*/zImage
fi

if [ -f ./mkbootimg/*/dt.img ]
then
    rm ./mkbootimg/*/dt.img
fi

if [ -d ./obj/ ]
then
    rm -r ./obj/
fi
