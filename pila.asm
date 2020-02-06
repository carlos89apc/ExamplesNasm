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
    m1 db '*',10
    m2 db '',10

section .text
  global _start 

_start:
    mov eax, 5
    mov ebx , 5
    jmp principal

principal:

    push eax
    push ebx
    escribir m1,1
    pop  ebx
    pop eax

    dec eax

    cmp eax,0
    jz imprimir
    jmp principal

imprimir:
    dec ebx
    push ebx
    escribir m2,2
    pop ebx
    mov eax,5
    cmp ebx,0
    jz salir
    jmp principal

salir:
    mov eax ,1
    int 80h