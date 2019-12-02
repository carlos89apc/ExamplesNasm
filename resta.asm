section .data
	m1 db "Ingrese el Minuendo",10
	l1 equ $-m1

	m2 db "Ingrese el Sustraendo",10
	l2 equ $-m2

	resultado db "La Diferencia es:",10
	lresultado equ $-resultado
	


section .bss
	d1 resb 2
	d2 resb 2
	resta resb 2

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

	
	mov ax,[d1]
	mov bx,[d2]
	sub ax,'0'   
	sub bx,'0'
	sub ax,bx
	add ax,'0'
	mov[resta], ax



;*******DIVISION ***********

	escribir resultado,lresultado
	escribir resta, 1
	int 80h

	mov eax, 1
	int 80h









