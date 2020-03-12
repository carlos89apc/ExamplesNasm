section .data
	msj_a: db 10, 'numero: x', 10
	ln_a equ $ - msj_a

  nlinea db 10, 10, 0
	lnlinea equ $ - nlinea

section .text
	global _start

_start:
	mov ecx, 9

l1:
	push ecx
	add ecx, '0'
	mov[msj_a + 8], dword ecx

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
