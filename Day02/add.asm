.model small
.stack 100h
.data

m1 db 5
m2 db 3

.code
start:

mov ax,@data
mov ds,ax

mov dl,m1
add dl,m2
add dl,48

mov ah,02h
int 21h

mov ax,4c00h
int 21h

end start