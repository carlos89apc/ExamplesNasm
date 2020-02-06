
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

    aviso db "QUE DESEA CALCULAR"
    laviso equ $-aviso

    menu1 db "1.Area Cuadrado",10
    lMenu1  equ $-menu1

    menu2 db "2.Area Rectangulo",10
    lMenu2  equ $-menu2

    menu3 db "3.Area Circulo",10
    lMenu3  equ $-menu3

      mopcion db "Ingrese una Opcion",10
    lopcion equ $-mopcion

    mopcionValida db "Ingrese una Opcion",10
    lopcionValida equ $-mopcionValida

	nlinea		db		"",10
	lnlinea		equ		$ - nlinea

    mladoCuadrado db "Ingrese lado del Cuadrado",10
    lcuadrado   equ $-mladoCuadrado

    mResladoCuadrado db "El area del cuadrado es",10
    lResladoCuadrado    equ $-mResladoCuadrado

    mBaseRectangulo db "Ingrese la base del Rectangulo",10
    lBaseRectangulo equ $-mBaseRectangulo

    mAlturaRectangulo db "Ingrese la Altura del Rectangulo",10
    lAlturaRectangulo equ $-mAlturaRectangulo
       
    mResladoRectangulo db "El area del Rectangulo es:",10
    lResladoRectangulo  equ $-mResladoRectangulo

    mRadio db "Ingrese el radio del Circulo",10
    lRadio equ $-mRadio

    m1 db "Ingrese una opcion valida",10
    l1 equ $-m1

    mRCirculo db "El area del Ciriculo es:",10
    lRcirculo equ $-mRCirculo
    
section .bss
	n1: resb 2
	n2: resb 2
    opcion: resb 2
    ladoCuadrado: resb 2
    RladoCuadrado: resb 2
    baseRectangulo: resb 2
    alturaRectangulo: resb 2
    AreaRectangulo: resb 2
    radio: resb 2
    RCirculo: resb 2
    RCirculo2: resb 2
section .text
	global _start

_start:


jmp Menu

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
    je E_cuadrado

    cmp ah,2
    je E_rectangulo


    cmp ah,3
    je E_circulo

    escribir m1,l1
    jmp Menu

E_cuadrado:
    escribir mladoCuadrado,lcuadrado
    leer ladoCuadrado,2
    
    mov al,[ladoCuadrado]
    mov bl,[ladoCuadrado]
    sub al, '0'
	sub bl, '0'
	mul bl
	add al, '0'
    mov [RladoCuadrado], al
    escribir mResladoCuadrado,lResladoCuadrado
    escribir RladoCuadrado, 1
    jmp Salir

E_rectangulo:

    escribir mBaseRectangulo,lBaseRectangulo
    leer baseRectangulo,2

    escribir mAlturaRectangulo,lAlturaRectangulo
    leer alturaRectangulo,2

    mov al,[baseRectangulo]
    mov bl,[alturaRectangulo]
    sub al, '0'
	sub bl, '0'
	mul bl
	add al, '0'
    mov [AreaRectangulo], al
    escribir mResladoRectangulo, lResladoRectangulo
    escribir AreaRectangulo,1
     jmp Salir

E_circulo:
    
    escribir mRadio,lRadio
    leer radio,1

    mov al,[radio]
    mov bl,[radio]
    sub al, '0'
	sub bl, '0'
	mul bl
	add al, '0'
    mov [RCirculo], al


    mov al,[RCirculo]
    mov bl, "3"
      sub al, '0'
	sub bl, '0'
	mul bl
	add al, '0'
    mov [RCirculo2], al

    escribir mRCirculo, lRcirculo
    escribir RCirculo2,1

Salir:
    mov eax, 4
	mov ebx, 1
	mov ecx, nlinea
	mov edx, lnlinea
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h