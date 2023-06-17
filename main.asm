; SPDX-License-Identifier: MIT

bits 16
org 0x7c00

start:
    mov ax, 0x07c0
    add ax, 288
    mov ss, ax
    mov sp, 4096

    mov ax, 0x07c0
    mov ds, ax

    ; print 'Hello World'
    mov si, hello_string
    call print_string

    jmp $

print_char:
    ; print character in al register
    mov ah, 0x0e
    int 0x10
    ret

print_string:
    ; print string pointed to by si register
print_string_loop:
    lodsb
    or al, al
    jz return_function
    call print_char
    jmp print_string_loop

return_function:
    ret

hello_string db 'Hello World', 0

times 510-($-$$) db 0
dw 0xaa55
