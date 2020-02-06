%macro escribir 2
    mov eax, 4 
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax,3
    mov ebx,0
    mov ecx,%1
    mov edx,%2
    int 80h
%endmacro

section .data
	lineas db "------------------------------", 10
	leng_lineas equ $ -lineas

	mensaje db "Ingrese 5 números y presione enter", 10
	leng_mensaje equ $ -mensaje

	m1 db 'Ingresar Primer Numero',0xA
	l1 equ $-m1
    m2 db 'Ingresar Segundo Numero',0xA
	l2 equ $-m2
    m3 db 'Ingresar Tercero Numero',0xA

    
	salto db "",10
	leng_salto equ $ -salto

	arreglo db 0,0,0,0,0
	leng_arreglo equ $ -arreglo

section .bss
	mayor resb 2
	n1 resb 2
	n2 resb 2
	n3 resb 2
	resultado resb 10

section .text
	global _start

_start:
	;Fuente
	mov esi, arreglo
	;Destino
	mov edi, 0

	escribir m1,l1
	leer n1,2
	escribir m2,l2
	leer n2,2
	escribir m3,l3
	leer n3,2


read:
	mov eax, 3
	mov ebx, 2
	mov ecx, resultado
	mov edx, 2
	int 80H

	mov al, [resultado]
	sub al, '0'

	mov [esi], al
	inc esi
	inc edi

	cmp edi, leng_arreglo
	;Mientras sea menor
	jb leer
	mov ecx, 0

comparar: 
	mov al, [arreglo+ecx]
	cmp al, bl
		jb contador
	mov bl, al

contador:
	inc ecx
	cmp ecx, leng_arreglo
	jb comparar

salir:
	add bl, '0'
	mov [mayor], bl

	mov eax, 4
	mov ebx, 1
	mov ecx, mayor
	mov ebx, 2
	int 80H

	mov eax, 1
	int 80H