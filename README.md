# Test_ASM-OS-Kernel
 A simple OS-Kernel

## Compile and run .asm files
```bash
# Build
fasm src/main.asm bin/boot_sector.bin
# Run
qemu-system-x86_64 bin/boot_sector.bin
# Build and run
fasm src/main.asm bin/boot_sector.bin && qemu-system-x86_64 bin/boot_sector.bin
```
