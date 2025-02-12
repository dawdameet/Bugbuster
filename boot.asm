[BITS 16]      ; Real mode
[ORG 0x7C00]  ; BIOS loads bootloader at 0x7C00

start:
    ; STACK
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00
    sti

    ; Print "Booting..."
    mov si, boot_msg
    call print_string

    ; Load kernel from disk (sector 2 onward) into 0x1000
    mov ah, 0x02     ; BIOS read sector function
    mov al, 5        ; Read 5 sectors
    mov ch, 0        ; Cylinder 0
    mov cl, 2        ; Sector 2 (sector 1 is bootloader)
    mov dh, 0        ; Head 0
    mov dl, 0x80     ; First hard drive
    mov bx, 0x1000   ; Load kernel at 0x1000
    int 0x13         ; Call BIOS disk interrupt
    jc disk_error    ; Jump if disk read fails

    jmp 0x1000       ; Jump to loaded kernel

disk_error:
    mov si, error_msg
    call print_string
    hlt

; Print function
print_string:
    mov ah, 0x0E  ; BIOS teletype mode
.loop:
    lodsb          ; Load next character from SI
    cmp al, 0
    je .done
    int 0x10
    jmp .loop
.done:
    ret

boot_msg db "Booting...", 0
error_msg db "DISK ERROR!", 0

; Padding to 512 bytes
times 510 - ($ - $$) db 0
dw 0xAA55  ; Boot signature
