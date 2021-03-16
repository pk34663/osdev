[org 0x7c00]
	mov ah,0x0e
	mov bx,HELLO_MSG
	call print_string
	mov bx,END_MSG
	call print_string
	jmp $

%include "printstring.asm"

;Data
HELLO_MSG:
	db '0x0000',0
END_MSG:
	db 'end',0

	times 510 - ($-$$) db 0
	dw 0xaa55
