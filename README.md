# POC bl808 LP RV32e project

based heavily on ch32v003 project https://github.com/nj-designs/libch32v

cmake toolchain based on https://github.com/jobroe/cmake-arm-embedded/blob/master/toolchain-arm-none-eabi.cmake and the makefile from ch32v003

not complete, not working, but hopefully useful to someone

Notes: linker + startup asm + vector table asm is from the ch32v003. Interrupts are definitely wrong, who knows what else.
