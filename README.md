# Test_ASM-OS-Kernel
 A simple OS-Kernel

## Compile and run .asm files
```Bash
# Build
nasm src/main.asm -f bin -o bin/boot_sector.bin
# Run
qemu-system-x86_64 bin/boot_sector.bin
```
