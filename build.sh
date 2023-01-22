#!/bin/sh
rm target -rf
cmake -B target --toolchain toolchain-rv32e-none-eabi.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build target
riscv64-unknown-elf-objcopy target/blinky -O binary target/lp_firmware.bin