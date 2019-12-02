%macro escribir 2
	mov eax, 4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro leer 2
	mov eax, 3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
	m1 db "Ingrese el primer número:"
	len1 equ $-m1

	m2 db "Ingrese el segundo número:"
	len2 equ $-m2

	mensaje db "El resultado es:"
	len equ $-mensaje
section .bss
	n1 resb 2
	n2 resb 2
	suma resb 1

section .text
	global _start

_start:

;*******INGRESAR DEL PRIMERO NUMERO***********

	escribir m1,len1
	leer n1 ,2

;*******INGRESAR EL NUMERO  2 ***********

	escribir m2,len2
	leer n2 ,2
	int 80h

;********* PROCESO DE SUMA *******
	mov ax,[n1]
	mov bx,[n2]
	sub ax,'0'   
	sub bx,'0'
	add ax,bx
	add ax,'0'
	mov[suma], ax

;*******SUMA ***********

	escribir mensaje,len
	escribir suma,1
	int 80h

	mov eax, 1
	int 80h

	
