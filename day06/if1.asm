; asembly program to input a single digit number and check if it is even or odd

.model small
.stack 100h
.data
	msg db "enter the number: $" ;5
	msg1 db "It is a even number $"
	msg2 db "It is a odd number $"
	n db 0 
	r db 0
	x db 2
	
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
	mov n,dl ;n=5

;next line
	mov dl,10
	mov ah,02h
	int 21h
	
;div 	

	mov ah,00 ;store reminder
	mov al,n ;n=5 dl=5
	div x  ;dl= dl/2 =5/2=1
	
	;mov bl,2  ;bl=2
	;div bl ;al/bl=5/2=2
	
	mov r,ah ;r=ah=1
	
	
	
;if check
	cmp r,0
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