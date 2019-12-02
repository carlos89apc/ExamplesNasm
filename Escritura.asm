 section .data
 	mensaje db "Ingrese su nombre",10
	tamano equ $-mensaje
	mensaje1 db "Nombre Ingresado es",10
	tamano1 equ $-mensaje1
section .bss
	nombre resb 10
	tamano2 equ $-nombre
 section .text
	global _start
 _start:
	mov eax,4
	mov ebx,1
	mov ecx, mensaje
	mov edx, tamano
	int 80h

	mov eax,3
	mov ebx,2
	mov ecx, nombre
	mov edx, tamano2
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx, mensaje1
	mov edx, tamano1
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx, nombre
	mov edx, tamano2
	int 80h

	mov eax,1
	int 80h
