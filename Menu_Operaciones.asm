
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
    m1 db "Ingrese el Primer Numero",10
	l1 equ $-m1

	m2 db "Ingrese el Segundo Numero",10
	l2 equ $-m2

	resultadosuma db "La Suma es:",10
	lsuma equ $-resultadosuma
	
    espacio db "",10
	lespacio equ $-espacio

    menu1 db "1.Suma",10
    lMenu1  equ $-menu1

    menu2 db "2.Multiplicacion",10
    lMenu2  equ $-menu2

    menu3 db "3.Division",10
    lMenu3  equ $-menu3

    menu4 db "4.Resta",10
    lMenu4  equ $-menu4

    mopcion db "Ingrese una Opcion",10
    lopcion equ $-mopcion

    mopcionValida db "Ingrese una Opcion",10
    lopcionValida equ $-mopcionValida

	nlinea		db		10,10,0
	lnlinea		equ		$ - nlinea

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
	n1: resb 2
	n2: resb 2
    opcion: resb 2
	Resta: resb 2
    Suma: resb 2
    Multiplicacion: resb 2
    Division: resb 2
    residuo: resb 2
    

section .text
	global _start

_start:

;*******INGRESAR Primer Numero***********	
	escribir m1,l1
	leer n1 ,2

;*******INGRESAR Segundo Numero***********	
	escribir m2,l2
	leer n2 ,2

Menu:
    mov eax, 4
    mov ebx, 1
    mov ecx, menu1
    mov edx, lMenu1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, menu2
    mov edx, lMenu2
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, menu3
    mov edx, lMenu3
    int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, menu4
    mov edx, lMenu4
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, mopcion
    mov edx, lopcion
    int 80h

	mov ebx, 0
	mov ecx, opcion
	mov edx, 2
	mov eax, 3
	int 80h
    mov ah,[opcion]
    sub ah, '0'

    cmp ah,1
    je S_Suma

    cmp ah,2
    je S_Multiplicacion

    cmp ah,3
    je S_division

    cmp ah,4
    je S_Resta

    mov eax, 4
    mov ebx, 1
    mov ecx, mopcionValida
    mov edx, lopcionValida
    int 80h


S_Resta:
	mov ax,[n1]
	mov bx,[n2]
	sub ax,'0'   
	sub bx,'0'
	sub ax,bx
	add ax,'0'
	mov[Resta], ax
    escribir resultadoResta,lResta
	escribir Resta, 1
    escribir espacio3,lespacio3
    jmp Salir

S_division:
   	mov al, [n1]	
	mov bl, [n2]
	sub al, '0'
	sub bl, '0'
	div bl
	add al, '0'
	mov [Division], al
    escribir resultadoDivision,lDivision
	escribir Division, 1
    escribir espacio2,lespacio2
    jmp S_Suma


S_Multiplicacion:
	mov al, [n1]	
	mov bl, [n2]
	sub al, '0'
	sub bl, '0'
	mul bl
	add al, '0'
	mov [Multiplicacion], al
    escribir resultadoMultiplicacion,lmultiplicacion
	escribir Multiplicacion, 1
    escribir espacio1,lespacio1
    jmp Salir


S_Suma:
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
    jmp Salir

Salir:
    mov eax, 4
	mov ebx, 1
	mov ecx, nlinea
	mov edx, lnlinea
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h