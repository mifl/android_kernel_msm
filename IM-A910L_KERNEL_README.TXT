How to Build:

    1. Get Toolchain (arm-eabi-4.6) and install
       (Visit android git server or codesourcery)

    2. wlan download:
        - https://www.codeaurora.org/cgit/quic/la/platform/vendor/qcom-opensource/wlan/prima/tag/?h=LNX.LA.3.5.1-09210-8x74.0

    3. Build the Kernel:
        1) Modify below lines in "build_ef63l.sh"
            export PATH=$(pwd)/../../../prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin:$PATH
        2) Run Kernel Build Script
            $ ./build_ef63l.sh

    4. Output Files:
        - kernel : ./zImage
        - module : ./obj/KERNEL_OBJ/drivers/*/*.ko

    5. Clean Kernel:
        1) Modify below lines in "clean_kernel.sh"
            export PATH=$(pwd)/../../../prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin:$PATH
        2) Run Kernel Clean Script
            $ ./clean_kernel.sh
