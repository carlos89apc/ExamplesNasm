section .data
	msj_a: db 'Ingrese el primer valor:',10
	len_a: equ $-msj_a
	msj_b: db 10,'Ingrese el segundo valor:',10
	len_b: equ $-msj_b
	msj_r1: db 10,'Cociente: '
	len_r1: equ $-msj_r1
	msj_r2: db 10,'Residuo: '
	len_r2: equ $-msj_r2
	msj_f: db 10,' ',10
	len_f: equ $-msj_f
	
section .bss
	a: resb 1
	b: resb 1
	r: resb 1
	
section .text
	global _start
	
_start:
	mov eax,04
	mov ebx,01
	mov ecx,msj_a
	mov edx,len_a
	int 80H

	mov eax,03
	mov ebx,02
	mov ecx,a
	mov edx,2
	int 80H

	mov eax,04
	mov ebx,01
	mov ecx,msj_b
	mov edx,len_b
	int 80H

	mov eax,03
	mov ebx,02
	mov ecx,b
	mov edx,2
	int 80H
	
	mov cl,0
	add cl,'0'
	mov [r],cl
	jmp compare
	
compare:
	mov al,[a]
	mov bl,[b]
	mov cl,[r]
	sub al,'0'
	sub bl,'0'
	sub cl,'0'
	cmp al,bl
	jc resultado
	jmp resta
	
resta:
	sub al,bl
	inc cl
	add al,'0'
	add cl,'0'
	mov [a],al
	mov [r],cl
	jmp compare
	
resultado:
	mov eax,04
	mov ebx,01
	mov ecx,msj_r1
	mov edx,len_r1
	int 80H
	
	mov eax,04
	mov ebx,01
	mov ecx,r
	mov edx,1
	int 80H
	
	mov eax,04
	mov ebx,01
	mov ecx,msj_r2
	mov edx,len_r2
	int 80H
	
	mov eax,04
	mov ebx,01
	mov ecx,a
	mov edx,1
	int 80H
	
	mov eax,04
	mov ebx,01
	mov ecx,msj_f
	mov edx,len_f
	int 80H

	mov eax,01
	mov ebx,00
	int 80H