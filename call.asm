%macro escribir 2
	mov eax, 4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro leer 2
	mov eax, 3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
section .data

    m1 db "*"
    m2 db 10,""
    

section .bss

section .text
    global _start
_start:

    mov ecx , 5

l1:
    push ecx 
    push ecx
    call print_new_line 
    pop ecx

l2:
    push ecx
    call print_asterisco
    pop ecx
    loop l2
    pop ecx
    loop l1

    jmp salir    

print_asterisco:

    mov eax ,4
    mov ebx ,1
    mov ecx ,m1
    mov edx ,1
    int 80h
    ret

print_new_line:

    mov eax ,4
    mov ebx ,1
    mov ecx ,m2
    mov edx ,1
    int 80h
    ret

salir: 
    mov eax ,1 
    int 80h