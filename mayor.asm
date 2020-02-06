section .data
	msg2 dd	10, 'Numero 1: '
	lmsg2 equ $ - msg2
 
	msg3 dd	'Numero 2: '
	lmsg3 equ $ - msg3
 
	msg4 db	10, '1. Comaparar', 10, 0
	lmsg4 equ $ - msg4
 
	igual db	10, 'Los numeros son iguales', 10
	lmsgigl equ $ - igual
	mayores db	10, 'El primero es mayor que el segundo', 10
	lmsgmyr equ $ - mayores
	menores db	10, 'El primero es menor que el segundo', 10
	lmsgmnr equ $ - menores
 
	nlinea db 10, 10, 0
	lnlinea equ $ - nlinea
 
section .bss
    num1: resb 2
	num2: resb 2
 
section .text
	global _start
 
_start: 
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, lmsg2
	int 80h
 
	mov eax, 3
	mov ebx, 0
	mov ecx, num1
	mov edx, 2
	int 80h
 
	; Imprimimos en pantalla el mensaje 3
	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, lmsg3
	int 80h
 
	; Obtenemos el numero 2
	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 2
	int 80h
 
	jmp comparar
 
comparar:
	mov al, [num1]
	mov bl, [num2]
 
	sub al, '0'
	sub bl, '0'

	cmp al, bl
 
	je iguales;son iguales
    ja mayor;el segundo es mayor
    jb menor;el segundo es menor
 
	jmp salir
    
iguales:
    ; Print on screen the message 9
	mov eax, 4
	mov ebx, 1
	mov ecx, igual
	mov edx, lmsgigl
	int 80h
    jmp salir
    
mayor:
    ; Print on screen the message 9
	mov eax, 4
	mov ebx, 1
	mov ecx, mayores
	mov edx, lmsgmyr
	int 80h
    jmp salir
    
menor:
    ; Print on screen the message 9
	mov eax, 4
	mov ebx, 1
	mov ecx, menores
	mov edx, lmsgmnr
	int 80h
    jmp salir
    
salir:
	; Imprimimos en pantalla dos nuevas lineas
	mov eax, 4
	mov ebx, 1
	mov ecx, nlinea
	mov edx, lnlinea
	int 80h
 
	; Finalizamos el programa
	mov eax, 1
	mov ebx, 0
	int 80h
