%macro escribir 2
  mov eax, 4
  mov ebx, 1
  mov ecx, %1
  mov edx, %2
  int 80h
%endmacro

section .data

    archivo db "/home/carlos/GitNasmExamples/ExamplesNasm/notas.txt",0

    m1 db "error en el archivo",10
    l1 equ $ -m1

section .bss
    texto resb 80
    idtexto resb 1

section .text
    global _start

_start:
    mov eax,3
    mov ebx,2
    mov ecx,texto
    mov edx,80
    int 80h

    mov eax,8
    mov ebx,archivo
    mov ecx,2
    mov edx,0X1FF
    int 80h

    test eax,eax
    jz error
    mov dword[idtexto],eax

    mov eax,4
    mov ebx,[idtexto]
    mov ecx,texto
    mov edx,80
    int 80h
    jmp salir

error:
    escribir m1,l1

salir: 
    
    mov eax,1
    int 80h

