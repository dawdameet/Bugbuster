[BITS 16]   ; Still in real mode (for simplicity)
[ORG 0x1000] ; Loaded by bootloader at 0x1000

start:
    ; Print "Kernel Loaded!"
    mov si, kernel_msg
    call print_string

    ; Halt the CPU
    hlt

; Print function (same as in bootloader)
print_string:
    mov ah, 0x0E
.loop:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .loop
.done:
    ret

kernel_msg db "Kernel Loaded!", 0
