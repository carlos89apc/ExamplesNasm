section .data
		asterisco db '*'
		nueva_linea db 10,''
section .text
		global _start

_start:
		mov ecx, 9
		mov ebx, 1
lado1:
	push ecx	
	push ebx
	call Enter
	
	pop ecx
	mov ebx, ecx
	push ebx
	
lado2:
	push ecx		
	call Asteriscoimprimir_enter
	pop ecx
	loop lado2
	
	pop ebx
	pop ecx
	inc ebx
	loop lado1			
	
	mov eax, 1
	int 80h

Asterisco:
	mov eax, 4
	mov ebx, 1
	mov ecx, asterisco
	mov edx, 1
	int 80h
	ret
	
Enter:
	mov eax, 4
	mov ebx, 1
	mov ecx, nueva_linea
	mov edx, 1
	int 80h
	ret




	