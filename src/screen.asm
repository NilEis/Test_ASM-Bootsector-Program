use16
; Set bp to the address of the String
; and cx to the String length
print_string:
    mov ax, 0x0               ; ╗
    mov es, ax                ; ╠ Set es = 0 + offset
    xor ax,ax                 ; ╝
    mov al, 1                 ; Set Write mode
    mov dh, 0                 ; Set row
    mov dl, 1                 ; Set column
    mov bl, 0xf               ; Set text-color to white
    mov ah, 13h               ; Set instruction 13h
    int 0x10
ret

; Set bp to the address of the string

print_string_pointer: dw '#'

print:
    mov ah, 03h
    xor bh, bh
    int 10h
    mov cx, 1
    mov bp, [print_string_pointer]
    print_loop:
        mov al, [bp]
        cmp al, 0
        je print_exit
        mov ah, 0Ah
        int 10h
        call cursor_move
        inc bp
        jmp print_loop
    print_exit:
ret

cursor_move:
    inc dl
    cmp dl, 80
    jl no_line_break
    xor dl, dl
    inc dh
no_line_break:
    mov ah, 02h
    int 10h
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