[org 0x7c00]
	mov ah,0x0e
    mov dx,0x1fd6
    shr dx,8
    and dx,0xf
    mov bx,HEX_ASCII
    mov al,[bx]
    int 0x10
    add bx,dx
    mov al,[bx]
    int 0x10

    jmp $
HEX_ASCII:
    db '0123456789abcdef',0
HEX_OUT:
	db '0x0000',0

	times 510 - ($-$$) db 0
	dw 0xaa55
