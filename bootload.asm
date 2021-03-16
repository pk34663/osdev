; Read some sectors from the boot disk using our disk_read function
[ org 0x7c00 ]
    xor  ax, ax
    mov  ds, ax
    mov  es, ax  
    mov [BOOT_DRIVE],dl ; BIOS stores our boot drive in DL,so it ’s
                        ; best to remember this for later.
    mov bx,BOOT_MSG
    call print_string
    mov ah,0x08
    int 0x13
    mov bp,0x8000 ; Here we set our stack safely out of the
    mov sp,bp     ; way , at 0 x8000
    mov bx,0x9000 ; Load 5 sectors to 0x0000 (ES ):0x9000 (BX)
    mov dh,2      ; from the boot disk.
    mov dl,[BOOT_DRIVE]
    call disk_load
    mov dx,[0x9000] ; Print out the first loaded word , which
    call printhex    ; we expect to be 0xdada , stored
                     ; at address 0x9000
    mov dx , [0x9000 + 512] ; Also , print the first word from the
    call printhex           ; 2nd loaded sector : should be 0xface
    jmp $
%include "printstring.asm" ; Re - use our print_string function
%include "hexprint.asm"    ; Re - use our print_hex function
%include "diskload.asm"    ; Include our new disk_load function
; Global variables
BOOT_DRIVE : db 0
BOOT_MSG : db "BOOTING",0
; Bootsector padding
times 510 -( $ - $$ ) db 0
dw 0xaa55
; We know that BIOS will load only the first 512 - byte sector from the disk ,
; so if we purposely add a few more sectors to our code by repeating some
; familiar numbers , we can prove to ourselfs that we actually loaded those
; additional two sectors from the disk we booted from.
times 15*256 dw 0xDADA
