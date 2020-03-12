
%macro imprimir 2 
	mov eax, 4 
	mov ebx, 1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro leer 2 
	mov eax, 3 
	mov ebx, 2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
	msj db "Ingrese un número",10
	len_msj equ $-msj
	msj1 db "El numero binario es",10
	len_msj1 equ $-msj1
	 
		uno db 0,'1',0
		dos db 0,'10',0
		tres db 0,'11',0
		cuatro db 0,'100',0
		cinco db 0,'101',0
		seis db 0,'110',0
		siete db 0,'111',0
		ocho db 0,'1000',0
		nueve db 0,'1001',0
section .bss
	respuesta resb 3
	
section .text
		global _start

_start:
	imprimir msj, len_msj
	leer respuesta, 3
	mov al,[respuesta]
	
	push eax
	imprimir msj1,len_msj1 
	pop eax
	sub al,'0'
	
	cmp al,1
	je imprimir_1
	cmp al,2
	je imprimir_2
	cmp al,3
	je imprimir_3
	cmp al,4
	je imprimir_4
	cmp al,5
	je imprimir_5
	cmp al,6
	je imprimir_6
	cmp al,7
	je imprimir_7
	cmp al,8
	je imprimir_8
	cmp al,9
	je imprimir_9
	
	jmp salir
	
imprimir_1:
	imprimir uno,2
	jmp salir
imprimir_2:
	imprimir dos,3
	jmp salir
imprimir_3:
	imprimir tres,4
	jmp salir
imprimir_4:
	imprimir cuatro,6
	jmp salir
imprimir_5:
	imprimir cinco,6
	jmp salir
imprimir_6:
	imprimir seis,6
	jmp salir
imprimir_7:
	imprimir siete,6
	jmp salir
imprimir_8:
	imprimir ocho,6
	jmp salir
imprimir_9:	
	imprimir nueve,6
	jmp salir

salir:
	mov eax,1
	mov ebx,0
	int 80h
	