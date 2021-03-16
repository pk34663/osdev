printhex:
    pusha
    mov bx,HEX_OUT

    push dx
    shr dx,12
    and dx,0xf
    mov di,dx
    mov cl,[HEX_ASCII + di]
    mov [bx+2],cl 
    pop dx

    push dx
    shr dx,8
    and dx,0xf
    mov di,dx
    mov cl,[HEX_ASCII + di]
    mov [bx+3],cl 
    pop dx

    push dx
    shr dx,4
    and dx,0xf
    mov di,dx
    mov cl,[HEX_ASCII + di]
    mov [bx+4],cl 
    pop dx

    push dx
    and dx,0xf
    mov di,dx
    mov cl,[HEX_ASCII + di]
    mov [bx+5],cl 
    pop dx
    call print_string
    popa

    ret

HEX_ASCII:
    db '0123456789abcdef',0
HEX_OUT:
	db '0x0000',0
