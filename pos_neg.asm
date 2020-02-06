%macro escribir 2 
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

%macro leer 2 
        mov eax, 3
        mov ebx, 0
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro
section .data

    numero1 db "Ingrese primer numero",10
    lnumero1 equ $ - numero1

    numero2 db "Ingrese segundo numero",10
    lnumero2 equ $ - numero2

    m1 db "El numero es negativo",10
    l1  equ $ - m1

    m2 db "El numero es positivo",10
    l2  equ $ - m2

section .bss
        n1 resb 3
        n2 resb 3

section .text
        global _start ; 
_start:

;*******INGRESAR Primer Numero***********	
        escribir numero1, lnumero1
        leer n1, 3
;*******INGRESAR Segundo Numero***********	
        escribir numero2, lnumero2
        leer n2, 3 


        mov ax, [n1]
        mov bx, [n2]
        sub ax, '0'
        sub bx, '0'
        sub ax,bx
        js negativo
        jmp positivo

positivo:
        escribir  m2,l2
        int 80h
        jmp salir
negativo:
        escribir m1 ,l1
        int 80h
        jmp salir

salir:

        mov eax, 1
        int 80h