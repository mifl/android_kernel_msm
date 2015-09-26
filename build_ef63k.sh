#!/bin/bash
###############################################################################
#
#                           Kernel Build Script 
#
###############################################################################
# 2015-09-07 mifl         : modified to generate a flashable boot.img
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
# make zImage
###############################################################################

mkdir -p ./obj/KERNEL_OBJ/
make ARCH=arm O=./obj/KERNEL_OBJ/ ef63k_defconfig
make -j4 ARCH=arm O=./obj/KERNEL_OBJ/ 2>&1 | tee kernel_log.txt

###############################################################################
# Copy Kernel Image
###############################################################################

if [ -f ./obj/KERNEL_OBJ/arch/arm/boot/zImage ]
then
    cp -f ./obj/KERNEL_OBJ/arch/arm/boot/zImage ./mkbootimg/ef63k
fi

##############################################################################
# Make BootImage
##############################################################################

# Prepare Device Tree Image (dt.img)
pushd ./mkbootimg/ef63k > /dev/null
./makedtimg.sh
popd > /dev/null


# Assembling the boot.img
pushd ./mkbootimg/ef63k > /dev/null
./makebootimg.sh
popd > /dev/null
