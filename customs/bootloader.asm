[BITS 16]
[ORG 0X7C00]
start:
    cli
    xor ax,ax
    mov ds,ax
    mov es, ax
    mov ss, ax
    sti

    mov si, msg
    call print

    mov ah,0x20
    mov al, 5
    mov ch, 0
    mov cl,2 
    mov dh, 0
    mov dl, 0x80
    mov bx,0x1000
    int 0x13

    jc derr
    jmp 0x1000

print:
    mov ah, 0x0E
.loop:
    lodsb
    cmp al,0
    je .exit
    int 0x10
    jmp .loop
.exit:
    ret
msg db "Booting...", 0
derr db "Disk ERROR", 0

times 510-($-$$) db 0
dw 0xAA55

