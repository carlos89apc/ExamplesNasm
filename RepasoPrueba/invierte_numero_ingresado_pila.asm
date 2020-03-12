section .data
	msj_a: db 'Ingerse un numero:', 0
	len_a: equ $-msj_a
	msj_b: db 'Ingerse un numero:', 0
	len_b: equ $-msj_b
	msj_p: db 10, 'El numero obtenido es: ', 0
	len_i: equ $-msj_p
	msj_f: db 10, ' ', 0
	len_f: equ $-msj_f
    
    nlinea db 10, 10, 0
	lnlinea equ $ - nlinea
	
section .bss
	a: resb 1
	b: resb 1
	r: resb 1
	r2: resb 1
	
section .text
	global _start
	
_start:
	mov eax, 04
	mov ebx, 01
	mov ecx, msj_a
	mov edx, len_a
	int 80H
	
	mov eax, 03
	mov ebx, 02
	mov ecx, a
	mov edx, 2
	int 80H
    
    mov ax, [a]
    push ax 
    
	mov eax, 04
	mov ebx, 01
	mov ecx, msj_b
	mov edx, len_b
	int 80H
	
	mov eax, 03
	mov ebx, 02
	mov ecx, b
	mov edx, 2
	int 80H
    
    mov ax, [b]
    push ax
    
    mov eax, 04
	mov ebx, 01
	mov ecx, msj_p
	mov edx, len_i
	int 80H

    pop bx
    mov [r], bx
    mov eax, 04
	mov ebx, 01
	mov ecx, r
	mov edx, 1
	int 80H
    
    mov eax, 04
	mov ebx, 01
	mov ecx, msj_p
	mov edx, len_i
	int 80H

    pop bx
    mov [r2], bx
    mov eax, 04
	mov ebx, 01
	mov ecx, r2
	mov edx, 1
	int 80H
    
    jmp salir

salir:
	mov eax, 4
	mov ebx, 1
	mov ecx, nlinea
	mov edx, lnlinea
	int 80h
 
	mov eax, 1
	mov ebx, 0
	int 80h
