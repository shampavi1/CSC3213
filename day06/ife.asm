; write the assembly program to check if a number is equal to 5.
; display "Hi" if equal else "Bye"


.model small
.stack 100h
.data
	msg db "enter the number: $" ;5
	msg1 db "Hi $"
	msg2 db "Bye $"
	n db 0 
	
.code
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg
	mov ah,09h ; callling string function
	int 21h ;print
	
;read digit	
	mov ah,01h ;al=5+48=53
	int 21h
	
	mov dl,al 
	sub dl,48 ;dl=53-48=5
	mov n,dl ;n=1

;next line
	mov dl,10
	mov ah,02h
	int 21h
	

;if check
	cmp n,5
	je m1
	jne m2
	
m1:
	mov dx,offset msg1
	mov ah,09h ; callling string function
	int 21h ;print

	jmp endn
m2:
	mov dx,offset msg2
	mov ah,09h ; callling string function
	int 21h ;print	
	
endn: ;return
	mov ax,4c00h    
	int 21h
	
end 