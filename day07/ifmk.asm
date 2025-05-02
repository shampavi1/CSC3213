;write a assembly program to input three marks, calculate the avg,
; and print if the subject passed (avg >= 50).

.model small
.stack 100h
.data
	msg1 db "Enter 1st marks:$"
	msg2 db "Enter 2nd marks:$"
	msg3 db "Enter 3rd marks:$"
	msg4 db "student passed$"
	msg5 db "student failed$"
	x db 3
	n1 db 0 
	n1t db 0
	n1o db 0
	n2 db 0 
	n2t db 0
	n2o db 0
	n3 db 0 
	n3t db 0
	n3o db 0
	t db 0
	avg db 0
.code
	mov ax,@data
	mov ds,ax
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;read 1st marks
	mov dx,offset msg1
	mov ah,09h
	int 21h
;read 1st digit	
	mov ah,01h ;al=1+48=49
	int 21h
	mov dl,al ;dl=49
	sub dl,48 ; dl=49-48=1
	mov n1t,dl ;h=1
;read 2nd digit	
	mov ah,01h ;al=3+48=51
	int 21h
	
	mov dl,al ;dl=51
	sub dl,48 ; dl=51-48=3
	
;1st num => 1*10=10
	mov al,n1t ;al=h=1
	mov bl,10 ;bl=10
	mul bl;al*10=10
	mov n1o,al ;n1=10
;2nd num => 10+3=13
	add dl,n1 ;dl+o=10+3=13
	mov n1,dl ;dig=d1=13
	
;next line
	mov dl,10
	mov ah,02h
	int 21h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;read 2nd digit	
	mov dx,offset msg2
	mov ah,09h
	int 21h
;read 1st digit	
	mov ah,01h ;al=1+48=49
	int 21h
	mov dl,al ;dl=49
	sub dl,48 ; dl=49-48=1
	mov n2t,dl ;h=1
;read 2nd digit	
	mov ah,01h ;al=3+48=51
	int 21h
	
	mov dl,al ;dl=51
	sub dl,48 ; dl=51-48=3
	
;1st num => 1*10=10
	mov al,n2t ;al=h=1
	mov bl,10 ;bl=10
	mul bl;al*10=10
	mov n2o,al ;n1=10
;2nd num => 10+3=13
	add dl,n1 ;dl+o=10+3=13
	mov n2,dl ;dig=d1=13
	
;next line
	mov dl,10
	mov ah,02h
	int 21h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;read 3rd digit		
	mov dx,offset msg3
	mov ah,09h
	int 21h
;read 1st digit	
	mov ah,01h ;al=1+48=49
	int 21h
	mov dl,al ;dl=49
	sub dl,48 ; dl=49-48=1
	mov n3t,dl ;h=1
;read 2nd digit	
	mov ah,01h ;al=3+48=51
	int 21h
	
	mov dl,al ;dl=51
	sub dl,48 ; dl=51-48=3
	
;1st num => 1*10=10
	mov al,n3t ;al=h=1
	mov bl,10 ;bl=10
	mul bl;al*10=10
	mov n3o,al ;n1=10
;2nd num => 10+3=13
	add dl,n1 ;dl+o=10+3=13
	mov n3,dl ;dig=d1=13
	
;next line
	mov dl,10
	mov ah,02h
	int 21h
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;calculate avg
	add dl,n2 
	add dl,n1 
	add dl,48 ;236
	
	mov ah,00 ;store reminder
	mov al,dl ;dl=236 al=236
	div x  ;dl= dl/3 = 236/3 = 78
	mov dl,avg
	
;if check
	cmp avg,50
	jge p1
	jl p2
	
p1:
	mov dx,offset msg4
	mov ah,09h ; callling string function
	int 21h ;print

	jmp endn
p2:
	mov dx,offset msg5
	mov ah,09h ; callling string function
	int 21h ;print	
	
	jmp endn
endn: ;return
	mov ax,4c00h    
	int 21h
	
end 