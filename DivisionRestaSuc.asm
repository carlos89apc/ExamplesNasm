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
        msj db 10, "Ingrese un Número:",10
        len1 equ $ - msj

        m1 db "",
        l1 equ $ - m1

        m2 db " ",
        l2 equ $ - m2

        	cuatro db 0,'100',0

section .bss
        n1 resb 1
        n2 resb 2
        resta resb 1
        cociente resb 1
        residuo resb 1
section .text
        global _start ; establece una posición de memoria
_start:
;        escribir msj, len1 
        leer n1, 2

            mov al, [n1]
	    mov bl, "2"
	    mov cx, 0
	    sub al, '0'
	    sub bl, '0'

division: 
        sub al, bl
	    inc cx
	    cmp al,bl
	    jg division
            je division
	    jmp mostrar

mostrar: 
	add al,'0'
	add cx,'0'
	mov [cociente], cx
	mov [residuo], al
        escribir m1, l1
        presentar cociente
        escribir m2, l2
        presentar residuo
        jmp salir

salir: 
        mov eax, 1
        int 80h
