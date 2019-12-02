section .data
    m1 db "Ingrese el Primer Numero",10
	l1 equ $-m1

	m2 db "Ingrese el Segundo Numero",10
	l2 equ $-m2

	resultadosuma db "La Suma es:",10
	lsuma equ $-resultadosuma
	
    espacio db "",10
	lespacio equ $-espacio

    espacio1 db "",10
	lespacio1 equ $-espacio1

    espacio2 db "",10
	lespacio2 equ $-espacio2

     espacio3 db "",10
	lespacio3 equ $-espacio3

   espacio4 db "",10
	lespacio4 equ $-espacio4

    resultadoMultiplicacion db "La Multiplicacion es:",10
	lmultiplicacion equ $-resultadoMultiplicacion

    resultadoDivision db "La Division es:",10
	lDivision equ $-resultadoDivision

    resultadoResiduo db "El Residuo es:",10
	lresultadoResiduo equ $-resultadoResiduo

    resultadoResta db "La Resta es:",10
	lResta equ $-resultadoResta

section .bss
	n1 resb 2
	n2 resb 2
	Resta resb 2
    Suma resb 2
    Multiplicacion resb 2
    Division resb 2
    residuo resb 2

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
;*******INGRESAR Primer Numero***********	

	escribir m1,l1
	leer n1 ,2


;*******INGRESAR Segundo Numero***********	

	escribir m2,l2
	leer n2 ,2

;********* PROCESO DE DIVISION *******

	
	mov al, [n1]	
	mov bl, [n2]
	sub al, '0'
	sub bl, '0'
	div bl
	add al, '0'
	mov [Division], al
	add ah, '0'
    mov [residuo], ah

;********* PROCESO DE Resta *******

	
	mov ax,[n1]
	mov bx,[n2]
	sub ax,'0'   
	sub bx,'0'
	sub ax,bx
	add ax,'0'
	mov[Resta], ax


;********* PROCESO DE Multiplicacion *******

	mov al, [n1]	
	mov bl, [n2]
	sub al, '0'
	sub bl, '0'
	mul bl
	add al, '0'
	mov [Multiplicacion], al


;********* PROCESO DE SUMA *******
	mov ax,[n1]
	mov bx,[n2]
	sub ax,'0'   
	sub bx,'0'
	add ax,bx
	add ax,'0'
	mov[Suma], ax


	escribir resultadosuma,lsuma
	escribir Suma, 1
    escribir espacio,lespacio
    
    escribir resultadoMultiplicacion,lmultiplicacion
	escribir Multiplicacion, 1
     escribir espacio1,lespacio1


    escribir resultadoResta,lResta
	escribir Resta, 1
    escribir espacio3,lespacio3


    escribir resultadoDivision,lDivision
	escribir Division, 1
    escribir espacio2,lespacio2
    escribir resultadoResiduo, lresultadoResiduo
	escribir residuo, 1
     escribir espacio4,lespacio4
	int 80h

	mov eax, 1
	int 80h
