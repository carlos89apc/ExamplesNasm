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

    Mmayor db  "El mayor número es el:",10
    lMayor equ $- Mmayor



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
    
    ;ASIGNACIÓN de un numero en el arreglo
    mov al, [numero]
    sub al,'0'
    mov [esi],al

    ;incrementar una posicion en el arreglo
    add esi,1
    add edi,1


    ;comparar para el salto
    cmp edi,lArreglo
    jb leerE
    mov esi,arreglo
    mov edi,0


imprimir:

    mov al, [esi]
    add al,'0'
    mov [numero],al
    
 
    mov eax,4
    mov ebx,1
    mov ecx,numero
    mov edx,1
    int 80h

    add esi,1
    add edi,1

     cmp edi,lArreglo
    jb imprimir


salir:

    mov eax ,1
    int 80h