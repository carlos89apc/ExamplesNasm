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
    msj1 db "Ingrese el total de nros primos a generar",10
    len_msj1 equ $ - msj1

section .bss
    num resb 2

section .text
    global _start
_start:
    escribir msj1, len_msj1
    leer num, 2

    mov ecx, [num]
    sub ecx, '0'

    mov eax, 2

for:
    push ecx
    push eax
    mov bl, 0
    mov cl, 0
    mov edx, eax

incrementar_contador: 
    inc bl     ;1 - 2 - 3 - 4 - 5
    mov al, dl 
    div bl  ;5/1 - 5/2 - 5/3 - 5/4 - 5/5
    cmp ah, 0 ; ah:0
    je incrementar_primo
    jmp incrementar_contador

no_primo:
    pop eax
    inc eax
    pop ecx
    inc ecx
    loop for 
    jmp salir

si_primo:
    add dl, '0'
    mov [num], dl
    escribir num, 1
    pop eax
    inc eax
    pop ecx
    loop for

    jmp salir

incrementar_primo:
    inc cl ;1 - 2
    cmp bl, dl ; 5>5
    jg presentar
    je presentar
    jmp incrementar_contador

presentar:
    cmp dl, 4
    jg restar_contador
    jmp igual_contador

restar_contador:  
    sub cl, 1
    cmp cl, 2
    jg no_primo
    je si_primo
    jmp no_primo

igual_contador:
    cmp cl, 2
    jg no_primo
    je si_primo
    jmp no_primo

salir:
    mov eax, 1
    int 80h
