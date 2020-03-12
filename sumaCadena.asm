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
    numero1 db '9234'
    numero2 db '4321'
    resultado db '      '
    lr equ $ -resultado

section .text 
    global _start

_start:


    mov esi, 4
    mov ecx , 5
    clc    ;desactivar el carry 
 proceso_suma:   
    mov al , [numero1 + esi]

    adc al,[numero2 + esi]
    aaa 
    pushf 
    or al , 30h
    popf 
    mov [resultado + esi],al
    dec esi
    loop proceso_suma

    escribir resultado, lr

    mov eax , 1
    int 80h