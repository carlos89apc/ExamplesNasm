section .data
	m1 db "Ingrese el Dividendo",10
	l1 equ $-m1

	m2 db "Ingrese el Divisor",10
	l2 equ $-m2

	resultado db "El Resultado es:",10
	lresultado equ $-resultado
	


section .bss
	d1 resb 2
	d2 resb 2
	division resb 2

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

	
	mov al, [d1]	
	mov bl, [d2]
	sub al, '0'
	sub bl, '0'
	div bl
	add al, '0'
	mov [division], al
    

;*******DIVISION ***********

	escribir resultado,lresultado
	escribir division, 1
	int 80h

	mov eax, 1
	int 80h









