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
        msj db 10, "Dividendo:",10
        len1 equ $ - msj
        msj2 db 10, "Divisor:",10
        len2 equ $ - msj2

        m1 db 10,"El cociente: ",10
        l1 equ $ - m1

        m2 db 10,"El residuo: ",10
        l2 equ $ - m2

section .bss
        n1 resb 1
        n2 resb 2
        resta resb 1
        cociente resb 1
        residuo resb 1
section .text
        global _start ; establece una posición de memoria
_start:

      
; ingreso del dividendo

;*******INGRESAR Primer Numero***********	
        escribir msj, len1 
        leer n1, 2
;*******INGRESAR Segundo Numero***********	
        escribir msj2, len2
        leer n2, 2 

            mov al, [n1]
	    mov bl, [n2]
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






