; Set bp to the address of the String
; and cx to the String length
print_string:
    mov ax, 0x0               ; ╗
    mov es, ax                ; ╠ Set es = 0 + offset
    xor ax,ax                 ; ╝
    mov al, 1                 ; Set Write mode
    mov dh, 0                 ; Set row
    mov dl, 0                 ; Set column
    mov bl, 0xf               ; Set text-color to white
    mov ah, 13h               ; Set instruction 13h
    int 0x10
ret

; https://en.wikipedia.org/wiki/BIOS_interrupt_call#INT_18h:_execute_BASIC
exec_BASIC:
    int 18h
ret

set_16_color_text_mode:; Set 80x25 16-color text mode
    xor ah, ah                ; Set ah = 0
    mov al, 0x03              ; Set instruction 0x03
    int 0x10                  ; Call int 0x10
ret

set_vga_mode:
    mov ax, 13h ; AH=0 (Change video mode), AL=13h (Mode)
    int 10h     ; Video BIOS interrupt
ret

; set al to the colour
; set cx to y
; set dx to x
set_pixel:
    mov ah, 0x0C
    int 10h
ret