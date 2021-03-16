;
; A simple boot sector program that demonstrates the stack.
mov ah,0x0e 
mov bp,0x8000 
mov sp,bp 
push 'A'
push 'B' 
push 'C'
; will be added by our assembler as 0 x00.
pop bx
mov al,bl ; then copy bl ( i.e. 8- bit char ) to al
int 0x10 ; print (al)
pop bx ; Pop the next value
mov al,bl
int 0x10 ; print (al)
mov al,[0x7ffe ] ; To prove our stack grows downwards from bp ,
; fetch the char at 0 x8000 - 0x2 ( i.e. 16 - bits )
int 0x10 ; print (al)
jmp $ ; Jump forever.
; Padding and magic BIOS number.
times 510 -( $ - $$ ) db 0
dw 0xaa55
