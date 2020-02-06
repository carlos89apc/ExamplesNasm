%macro print 2
    mov eax , 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h

%endmacro

%macro read 2
    mov eax , 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h

%endmacro 

section .data
    m1 db "Escribir un numero",10
    l1 equ $ - m1

    m2 db "Saludos",10
    l2 equ $ -m2

section .bss
     num resb 1

section .text

    
    global _start
_start:    

    print m1 ,l1
    read num , 1

    jmp imprimir

imprimir:


    mov eax , [num]
    push eax
    print num,1
    pop eax 
    sub eax, '0'
    dec eax
    mov ecx,eax
    add eax , '0'
    mov [num],eax
    cmp ecx,-1
    jz salir
    jmp imprimir



salir:
    mov eax,1
    int 80h