; Read some sectors from the boot disk using our disk_read function
[ org 0x7c00 ]
    xor  ax, ax
    mov  ds, ax
    mov  es, ax  
    mov [BOOT_DRIVE],dl ; BIOS stores our boot drive in DL,so it ’s
                        ; best to remember this for later.
    mov ah,0x08 ; BIOS disk info
    int 0x13    ; BIOS interrupt
    jmp $
; Global variables
BOOT_DRIVE : db 0
; Bootsector padding
times 510 -( $ - $$ ) db 0
dw 0xaa55
