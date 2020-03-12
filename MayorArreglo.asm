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

    m1 db  "Ingrese 6 Números",10
    l1 equ $- m1


    m2 db "Los numeros del arreglo son",10
    l2 equ $- m2

    Mmayor db  "El número mayor  es el:",10
    lMayor equ $- Mmayor

    salto db  "",10


    Mmenor db  "El número menor es el:",10
    lMenor equ $- Mmenor


    ;definir Arreglo

    arreglo db 0,0,0,0,0,0
    lArreglo equ $ -arreglo

section .bss
    numero resb 2


section .text

    global _start

_start:

    escribir m1,l1

    ;ASIGNACIÓN DEL ARREGLO EN LAS POSICIONES EFECTIVAS
    mov esi,arreglo
    mov edi,0

leerE:
    leer numero,2
    
    mov al, [numero]
    sub al,'0'
    mov [esi],al

    add esi,1
    add edi,1

    cmp edi,lArreglo
    jb leerE

    mov esi,arreglo
    mov edi,0
    mov bl, 9


comparacionMenor:
    mov al,[esi]
    cmp al,bl
    jg contMenor
    mov bl,al

contMenor:
    add esi,1
    add edi,1
    cmp edi,lArreglo
    jb comparacionMenor

imprimirMenor:

    add bl,"0"
    mov [numero],bl
    escribir Mmenor,lMenor
    escribir numero,2

    mov esi,arreglo
    mov edi,0
    mov bl, 1

comparacionMayor:
    mov al,[esi]
    cmp al,bl
    jb contMayor
    mov bl,al

contMayor:
    add esi,1
    add edi,1
    cmp edi,lArreglo
    jb comparacionMayor

imprimirMayor:

    add bl,"0"
    mov [numero],bl
    escribir Mmayor,lMayor
    escribir numero,2

salir:

    mov eax ,1
    int 80h