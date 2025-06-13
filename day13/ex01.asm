; print Uppercase Letter (i tried it )

.model small
.stack 100h
.data
	s db ' $'
	l db 0
	msg1 db 'Uppercase Letters : $'
	msg2 db 'Lowercase Letters : $'
	msg3 db 'Enter a letter : $'
	msg4 db 10, "It's an upper case letter  $"
	msg5 db 10, "It's a lower case letter  $"
	msg6 db 10, "Wrong Input $" 

.code
main:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1
	mov ah, 09h
	int 21h
	
	mov cl,26
	mov bl,65

print_all_Uppercase:
	mov ah,02h
	mov dl,bl
	int 21h
	
	mov dx,offset s
	mov ah, 09h
	int 21h
	
	inc bl
	loop print_all_Uppercase
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov dx,offset msg2
	mov ah, 09h
	int 21h
	
	mov cl,26
	mov bl,97

print_all_Lowercase:
	mov ah,02h
	mov dl,bl
	int 21h
	
	mov dx,offset s
	mov ah, 09h
	int 21h
	
	inc bl
	loop print_all_Lowercase
	
	mov dl,10
	mov ah,02h
	int 21h
	
	;-------------user input-------------
	;65-90 upper
	;97-122 lower
	mov dx,offset msg3
	mov ah, 09h
	int 21h
	
	mov ah,01h
	int 21h
	
	mov dl,al
	mov l,dl
	
	cmp l,65
	jl m1 ;invalid
	jge m2 ;check less than 90
	
	m1: ;invalid
		mov dx,offset msg6
		mov ah, 09h
		int 21h
		
		jmp endn
	m2:
		cmp l,90
		jle m3 ;Uppercase
		jg m4 ;check lower or not
		
	m3: ;Uppercase
		mov dx,offset msg4
		mov ah, 09h
		int 21h
		
		add dl,32
		mov ah,02h
		int 21h
		
		jmp endn
	m4:
		cmp l,97
		jl m5 ;Invalid
		jg m6 ;check lower or not
		
	m5: ;invalid
		mov dx,offset msg6
		mov ah, 09h
		int 21h
		
		jmp endn
	m6:
		cmp l,122
		jle m7 ;Lowercase
		jg m8 ;invalid
		
	m7:
		mov dx,offset msg5
		mov ah, 09h
		int 21h
		
		sub dl,32
		mov ah,02h
		int 21h
		
		jmp endn
	m8:;invalid
		mov dx,offset msg6
		mov ah, 09h
		int 21h
		
		jmp endn
		
	endn:
	mov ax, 4c00h
	int 21h
	
end main
