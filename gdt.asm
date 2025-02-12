gdt_start:
    dq 0x0000000000000000   ; Null Descriptor (must be first)

gdt_code:
    dq 0x00CF9A000000FFFF   ; Code Segment (base=0, limit=0xFFFFF, flags)

gdt_data:
    dq 0x00CF92000000FFFF   ; Data Segment

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1   ; GDT size
    dd gdt_start                 ; GDT location
