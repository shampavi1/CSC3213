; 
; This code only supports below 256
.model small
.stack 100h
.data
	msg db "enter the number: $"
	h db 0 ;1
	t db 0 ;2
	o db 0 ;3
	h1 db 0 ;100
	dig db 0;123
	rh db 0
	rt db 0
.code
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg
	mov ah,09h ; callling string function
	int 21h ;print
;read 1st digit	
	mov ah,01h ;al=1+48=49
	int 21h
	
	mov dl,al ;dl=49
	sub dl,48 ; dl=49-48=1
	mov h,dl ;h=1
;read 2nd digit	
	mov ah,01h ;al=2+48=50
	int 21h
	
	mov dl,al ;dl=50
	sub dl,48 ; dl=50-48=2
	mov t,dl ;t=2
;read 3rd digit
	mov ah,01h ;al=3+48=51
	int 21h
	
	mov dl,al ;dl=51
	sub dl,48 ; dl=51-48=3
	mov o,dl ;o=3
	
;1st num => 1*100=100
	mov al,h ;al=h=1
	mov bl,100 ;bl=100
	mul bl;al*100=100
	mov h1,al ;h1=100
;2nd num => 2*10=20+100=120
	mov al,t ;al=t=2
	mov bl,10 ;bl=10
	mul bl;al=2*10=20
	mov dl,al ;dl=20
	add dl,h1 ;dl=dl+h1=20+100=120
;3rd num => 123+3=123
	add dl,o ;dl+o=120+3=123
	mov dig,dl ;dig=d1=123
;next line
	mov dl,10
	mov ah,02h
	int 21h
	
;return combained number as single digit
	mov ah,00
	mov al,dig ;al=dig=123
	mov bl,100 ;bl=100
	div bl ;al=al/bl=123/100=1    r=23
	
	mov rh,ah ;rh=23
	
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
	
	mov ah,00
	mov al,rh
	mov bl,10
	div bl ; al=23/10=2   r=3
	
	mov rt,ah
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
	                                                       
	mov dl,rt
	add dl,48
	mov ah,02h
	int 21h
	
;return
	mov ax,4c00h    
	int 21h
	
end 