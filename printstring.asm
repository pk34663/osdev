print_string:
	pusha
    mov ah,0x0e
printchar:
	mov al,[bx]
	cmp al,0x0
	je return
	mov al,[bx]
	int 0x10
	add bx,1
	jmp printchar
return:
	popa
	ret
