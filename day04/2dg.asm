.model small
.stack 100h
.data
	msg db "enter 1st digit: $"
	n1 db 0
	n2 db 0

.code
start:
;1st digit
	mov ah,01h
;2nd digit
	mov ah,01h
	int 21h
	
	sub al,48
	mov 0,al ;o=3
	
	mov bl,10
	
	mov dl,al 
	add dl,o ;dl=dl+o=20+3=23
	
	mov dig,dl ;dig=23
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov al,00 ;ah==0
	mov bl,10 ;bl=10
	mov al,dig ;al=23
	div bl     ;al=al/bl=23/10=2
	mov r,ah
	mov
	add
;return
	mov ax,4c00h    
	int 21h
	
end start