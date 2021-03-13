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