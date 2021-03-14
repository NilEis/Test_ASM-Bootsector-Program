[bits 16]                 ; Set 16 bit mode
[org 0x7c00]              ; Offset added to all adresses

call set_vga_mode


mov al, 05
mov cx, 10
mov dx, 10
call set_pixel

mov bp, hwString          ; Set bp = hwString + offset
mov cx, [hwLength]        ; Set String length
call print_string         ; call the function print_string

jmp $                     ; Infinite loop

%include "src/screen.asm"

hwString db  'Hello world'
hwLength db ($-hwString)
times 510-($-$$) db 0     ; Fill rest of bootsector with 0
dw 0xaa55                 ; Set the last to 0xaa55
times 1474560-($-$$) db 0 ; Resize file to 1.4 mb (Floppy)