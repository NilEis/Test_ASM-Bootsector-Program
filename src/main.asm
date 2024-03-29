[bits 16]                 ; Set 16 bit mode
[org 0x7c00]              ; Offset added to all adresses

call set_vga_mode

mov cx, 160
mov dx, 100
mov al, 05
loop:
; ---------------------------------------
push cx                                ; Save cx
push dx                                ; Save dx
call fill_colour_rect                  ; 
pop dx                                 ; Restore dx
pop cx                                 ; Restore cx
; ---------------------------------------
call set_pixel
mov ah, al
push ax
mov ah, 0x00
xor al, al
int 0x16
cmp al, 'q'
je inc_colour
cmp al, 'e'
je dec_colour
cmp al, 's'
je down
cmp al, 'w'
je up
cmp al, 'a'
je left
cmp al, 'd'
je right
cmp al, ' '
jne loop
call set_16_color_text_mode
mov bp, exit_str
call print
cli
hlt
right:
add cx,1
pop ax
jmp loop
left:
sub cx,1
pop ax
jmp loop
up:
sub dx,1
pop ax
jmp loop
down:
add dx,1
pop ax
jmp loop
inc_colour:
pop ax
inc al
jmp loop
dec_colour:
pop ax
dec al
jmp loop

fill_colour_rect:
    mov dx, 10
fcr_outer_loop:
    mov cx, 10
fcr_inner_loop:
    call set_pixel
    inc cx
    cmp cx, 50
    jl fcr_inner_loop
    inc dx
    cmp dx, 50
    jl fcr_outer_loop
ret

exit_str: db "exit", 0

%include "src/screen.asm"
times 510-($-$$) db 0     ; Fill rest of bootsector with 0
dw 0xaa55                 ; Set the last to 0xaa55
times 1474560-($-$$) db 0 ; Resize file to 1.4 mb (Floppy)