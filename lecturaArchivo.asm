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

    archivo db "/home/carlos/GitNasmExamples/ExamplesNasm/codigo.txt",0

    m1 db "error en el archivo",10
    l1 equ $ -m1

section .bss
    
    texto resb 80
    idArchivo resb 1
    

section .text

    global _start

_start:


    mov eax, 5 ; se convoca una subrutina de lectura al section
    mov ebx, archivo
    mov ecx, 0 ;modo de acceso : cuando  R-only= 0  W-only=1    Rdwt = 2
    mov edx, 0
    int 80h 

    test eax,eax
    jz error
    mov dword[idArchivo],eax
    mov eax,3
    mov ebx,[idArchivo]
    mov ecx,texto
    mov edx,80
    int 80h

    escribir texto,80
    jmp salir


error:
    escribir m1,l1

 salir: 
    
    mov eax,1
    int 80h


 