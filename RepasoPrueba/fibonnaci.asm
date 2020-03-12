section .data
	msj_a: db 10, 'x, ', 0
	ln_a equ $ - msj_a

  nlinea db 10, 0
	lnlinea equ $ - nlinea

section .text
	global _start

_start:
	mov ax, 0
	mov bx, 1
	mov ecx, 9

l1:
	push ecx
	add ax, bx
	mov bx, ax
	add ax, '0'
	mov[msj_a], dword ax

	mov eax, 4
	mov ebx, 1
	mov ecx, msj_a
	mov edx, ln_a
	int 80H

	pop ecx
	loop l1

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
