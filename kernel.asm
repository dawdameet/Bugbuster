[BITS 16]
[ORG 0x1000]  ; Kernel loads at 0x1000

start:
    mov ah, 0x0E
    mov al, 'K'
    int 0x10
    mov al, 'e'
    int 0x10
    mov al, 'r'
    int 0x10
    mov al, 'n'
    int 0x10
    mov al, 'e'
    int 0x10
    mov al, 'l'
    int 0x10
    mov al, '!'
    int 0x10

    jmp $  ; Halt

