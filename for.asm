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
%macro presentar 1
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, 1
        int 80h
%endmacro
section .data

    m1 db "Item:",10
    l1 equ $ - m1

section .bss
        aux resb 20
section .text
        global _start ; 
_start:
        mov cx,10
       
ciclo:
        cmp cx,0
        jz salir

        dec cx
        jnz imprimir_mensaje


imprimir_mensaje:
        

        mov eax , 4
        mov ebx , 1
        push ecx 
        add cx,'0'
        mov [aux],cx
        mov ecx, aux
        int 80h
        mov edx, l1
        pop ecx
        jmp ciclo
       
salir:

        mov eax, 1
        int 80h