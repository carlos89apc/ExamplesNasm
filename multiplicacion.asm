section .data
	m1 db "Ingrese el Multiplicando",10
	l1 equ $-m1

	m2 db "Ingrese el Multiplicador",10
	l2 equ $-m2

	resultado db "El Producto es:",10
	lresultado equ $-resultado
	


section .bss
	d1 resb 2
	d2 resb 2
	multiplicacion resb 2

section .text 	
	global _start

_start:
	
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
;*******INGRESAR DIVIDENDO***********	

	escribir m1,l1
	leer d1 ,2


;*******INGRESAR DIVISOR***********	

	escribir m2,l2
	leer d2 ,2

;********* PROCESO DE DIVISION *******

	xor ax,ax 
	mov al, [d1]	
	mov bl, [d2]
    

;*******DIVISION ***********

	escribir resultado,lresultado
	escribir multiplicacion, 1
	int 80h

	mov eax, 1
	int 80h









