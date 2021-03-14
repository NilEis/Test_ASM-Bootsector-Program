[bits 16]                 ; Set 16 bit mode
[org 0x7c00]              ; Offset added to all adresses

; Set 80x25 16-color text mode
xor ah, ah                ; Set ah = 0
mov al, 0x03              ; Set instruction 0x03
int 0x10                  ; Call int 0x10

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