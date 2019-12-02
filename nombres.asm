 section .data
 	mensaje db "Carlos",10
	tamano equ $-mensaje
	mensaje1 db "Augusto",10
	tamano1 equ $-mensaje1
	mensaje2 db "Paredes",10
	tamano2 equ $-mensaje2
	mensaje3 db "Cordova",10
	tamano3 equ $-mensaje3

	
	
	

 section .text
	global _start
 _start:
	mov eax,4
	mov ebx,1
	mov ecx, mensaje
	mov edx, tamano
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx, mensaje1
	mov edx, tamano1
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx, mensaje2
	mov edx, tamano2
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx, mensaje3
	mov edx, tamano3
	int 80h

	mov eax,1
	int 80h






