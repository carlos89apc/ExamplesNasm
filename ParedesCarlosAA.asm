
section .data
    m1 db 'Ingrese un número: '
    lm1 equ $-m1

    mPrimo db 'El número que usted ingreso es primo',10
    lPrimo equ $-mPrimo

    mNoPrimo db 'El número que usted ingreso no primo',10
    lNoPrimo equ $-mNoPrimo

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


section .bss
    num resb 2
section .text
    global _start
_start:

    escribir m1, lm1
    leer num, 2
    mov cl,1

CompararNumero:
    mov al,[num]
    sub al, '0'
    cmp al,cl
    je NumeroPrimo
    jmp DividirNumeroPrimo

DividirNumeroPrimo:
    mov bl, 0
    mov al, [num]
    sub al, '0'
    div cl
    inc cl
    cmp bl, 0
    je NumeroNoEsPrimo
    jmp CompararNumero
    
NumeroNoEsPrimo:
    escribir mNoPrimo,lNoPrimo
    jmp salir

NumeroPrimo:
    escribir mPrimo,lPrimo
    jmp salir


salir:
    mov eax, 1
    int 80h