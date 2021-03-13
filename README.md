# Test_ASM-OS-Kernel
 A simple OS-Kernel

## Compile and run .asm files
```Bash
# vm
nasm src/main.asm -f bin -o bin/boot_sector.bin
# Host
qemu-system-x86_64 bin/boot_sector.bin
```
