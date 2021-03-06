#!/bin/bash
##############################################################################
#
# Kernel Build Script
#
##############################################################################

##############################################################################
# Set variables
##############################################################################
BUILD_KERNEL_OUT_DIR=obj
BUILD_JOB_NUMBER=`grep processor /proc/cpuinfo | wc -l`
BUILD_KERNEL_LOG=kernel_log.txt

##############################################################################
# Set toolchain
##############################################################################
export ARCH=arm
export PATH=$(pwd)/../../../prebuilts/gcc/linux-x86/arm/arm-eabi-4.7/bin:$PATH
export CROSS_COMPILE=arm-eabi-

##############################################################################
# Set defconfig
##############################################################################
DEFCONFIG_FILE=$1

if [ -z "$DEFCONFIG_FILE" ]; then
	echo "Need defconfig file(hammerhead_defconfig)!"
	exit -1
fi

if [ ! -e arch/arm/configs/$DEFCONFIG_FILE ]; then
	echo "No such file : arch/arm/configs/$DEFCONFIG_FILE"
	exit -1
fi

##############################################################################
# Build kernel
##############################################################################
mkdir -p ./$BUILD_KERNEL_OUT_DIR/
make ARCH=arm O=./$BUILD_KERNEL_OUT_DIR/ ${DEFCONFIG_FILE}
make -j$BUILD_JOB_NUMBER ARCH=arm O=./$BUILD_KERNEL_OUT_DIR/ 2>&1 | tee $BUILD_KERNEL_LOG

##############################################################################
# Copy kernel image
##############################################################################
if [ -f ./$BUILD_KERNEL_OUT_DIR/arch/arm/boot/zImage ]
then
	cp -f ./$BUILD_KERNEL_OUT_DIR/arch/arm/boot/zImage ./
fi
