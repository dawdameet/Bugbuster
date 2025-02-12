[BITS 16]   ; We're in real mode (16-bit)
[ORG 0x7C00] ; Boot sector loads at 0x7C00

start:
    cli          ; Disable interrupts
    mov ax, 0    ; Set data segment
    mov ds, ax
    mov es, ax

    ; Print message using BIOS interrupt
    mov si, message
    call print_string

    hlt          ; Halt CPU

; ================================
; Print String using BIOS Interrupt 0x10
; ================================
print_string:
    mov ah, 0x0E  ; BIOS teletype function
.loop:
    lodsb        ; Load next character from [SI] into AL
    cmp al, 0    ; Check if null-terminated
    je .done
    int 0x10     ; Print character
    jmp .loop
.done:
    ret

; ================================
; Data Section
; ================================
message db "Real Mode Kernel Loaded!", 0

; Boot signature (Mandatory for bootable disk)
times 510-($-$$) db 0
dw 0xAA55
