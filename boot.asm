[BITS 16]
[ORG 0x7C00]    ; BIOS loads boot sector here

start:
    cli             ; Disable interrupts
    mov ax, 0x07C0  ; Setup stack
    mov ss, ax
    mov sp, 0xFFFF
    sti             ; Enable interrupts

    ; Print message
    mov ah, 0x0E
    mov al, 'L'
    int 0x10
    mov al, 'o'
    int 0x10
    mov al, 'a'
    int 0x10
    mov al, 'd'
    int 0x10
    mov al, 'i'
    int 0x10
    mov al, 'n'
    int 0x10
    mov al, 'g'
    int 0x10
    mov al, ' '
    int 0x10
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
    mov al, '.'
    int 0x10

    ; Load kernel (sector 2, memory address 0x1000)
    mov ah, 0x02      ; BIOS read function
    mov al, 10        ; Read 10 sectors
    mov ch, 0         ; Cylinder 0
    mov cl, 2         ; Start at sector 2
    mov dh, 0         ; Head 0
    mov dl, 0x80      ; First hard disk
    mov bx, 0x1000    ; Load kernel to 0x1000
    int 0x13          ; Call BIOS disk read

    jmp 0x1000        ; Jump to kernel

times 510-($-$$) db 0  
dw 0xAA55  
