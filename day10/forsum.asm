;Use a loop to display sum of the numbers from 1 to 5 (eg, 1+2+3+4+5)
.model small
.stack 100h
.data
	sum db 0
	r db 0

.code
main:
	mov ax,@data
	mov ds,ax
	
	mov cl,5

loop_start: ;cl=5
	mov dl,sum ;dl=sum
	add dl,cl ;dl=dl+cl
	mov sum,dl ;sum=dl=9
	
	loop loop_start
	;sum=15
	mov al,sum
	mov ah,00
	mov bl,10
	div bl
	mov r,ah
	
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
	
	mov dl,r
	add dl,48
	mov ah,02h
	int 21h
	
	mov ax, 4c00h
	int 21h
	
end main
