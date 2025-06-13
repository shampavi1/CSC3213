;(not completed my work)
.model small
.stack 100h
.data
	n db 0
	nr db 0
	s1 db "    $"
	msg1 db "Enter the value for n : $" 
	msg2 db "Enter the value for r : $"
	msg3 db "nPr Value is : $"
.code
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1
	mov ah,09h
	int 21h
	
	call getInput
	mov n,al
	
	mov dx,offset msg2
	mov ah,09h
	int 21h
	
	call getInput
	sub al,n
	
	proc getInput
	
		mov ah,01h
		int 21h
		
		sub al,48
	
		mov dl,0ah
		mov ah,02h
		int 21h
	endp
	
	
		
mov ax,4c00h
int 21h
 
end	