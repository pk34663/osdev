; Read some sectors from the boot disk using our disk_read function
[ org 0x7c00 ]
    xor  ax, ax
    mov  ds, ax
    mov  es, ax  
    mov [BOOT_DRIVE],dl ; BIOS stores our boot drive in DL,so it ’s
                        ; best to remember this for later.
    mov bp,0x8000 ; Here we set our stack safely out of the
    mov sp,bp     ; way , at 0 x8000
    mov bx,0x9000 ; Load 5 sectors to 0x0000 (ES ):0x9000 (BX)
    mov dh,2      ; from the boot disk.
    mov dl,[BOOT_DRIVE]
    mov ah,0x02 ; BIOS read sector function
    mov al,dh ; Read DH sectors
    mov ch,0x00 ; Select cylinder 0
    mov dh,0x00 ; Select head 0
    mov cl,0x02 ; Start reading from second sector ( i.e.
                ; after the boot sector )
    int 0x13    ; BIOS interrupt
    jmp $
; Global variables
BOOT_DRIVE : db 0
