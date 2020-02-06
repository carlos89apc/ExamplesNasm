;***REPASO***
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

%macro presentar 1
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, 1
        int 80h
%endmacro

section .data
	msj1 db 'ingrese el primer numero:',10
	len1 equ $-msj1
	msj2 db 'ingrese el segundo numero:',10
	len2 equ $-msj2
section .bss
	n1 resb 2
	n2 resb 2
    Suma resb 2
section .text

global _start

_start:

escribir msj1,len1
leer n1,2
escribir msj2,len2
leer n2,2
;*****suma****
    mov ax,[n1]
	sub ax,'0'   
	mov bx,[n2]
	sub bx,'0'
	add ax,bx
	add ax,'0'
	mov[Suma], ax
;*******

;*******resta*****
	mov ax,[n1]
	mov bx,[n2]
	sub ax,'0'   
	sub bx,'0'
	sub ax,bx
	add ax,'0'
	mov[Resta], ax

;***********

;*******Multiplicacion******
	mov al, [n1]	
	mov bl, [n2]
	sub al, '0'
	sub bl, '0'
	mul bl
	add al, '0'
	mov [Multiplicacion], al
;***********

;*************Division*********
	mov al, [d1]	
	mov bl, [d2]
	sub al, '0'
	sub bl, '0'
	div bl
	add al, '0'
	mov [division], al
	add ah, '0'
    mov [residuo], ah

;*************positivo y negativo***
         mov ax, [n1]
        mov bx, [n2]
        sub ax, '0'
        sub bx, '0'
        sub ax,bx
        js negativo
        jmp positivo

positivo:
        escribir  m2,l2
        int 80h
        jmp salir
negativo:
        escribir m1 ,l1
        int 80h
        jmp salir

;**********

;*********Decremeto******
imprimir:
	mov eax, 4
	mov ebx, 1
	mov ecx, numero
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, new_line
	mov edx, 1
	int 80h

	mov eax, [numero]
	sub eax, '0'
	dec eax	
	mov ecx, eax
	add eax, '0'
	mov [numero], eax	

	cmp ecx, 0
	jz salir
	jmp imprimir

salir:
	mov eax, 1
	int 80h
;********************


;**********Mayor de 3 numero*********
;///////////////////////////	
	mov eax,[n1]
	mov ebx,[n2]
	mov ecx,[n3]

	
	cmp eax,ebx
	jg compare
	jmp compare2
	


compare:
	cmp eax,ecx
	jg pmayor
	jmp tmayor
	
compare2:
	cmp ebx,ecx
	jg smayor
	jmp tmayor

	
pmayor:
	mov eax,4
	mov ebx,1
	mov ecx,msj_p
	mov edx,len_p
	int 80h

	mov eax,1
	int 80h

smayor:
	mov eax,4
	mov ebx,1
	mov ecx,msj_s
	mov edx,len_s
	int 80h

	mov eax,1
	int 80h
	
tmayor:
	mov eax,4
	mov ebx,1
	mov ecx,msj_t
	mov edx,len_t
	int 80h

	mov eax,1
	int 80h
;************


;***************Division CON resta sucesivas**********
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

;*****************
mov eax , 1
int 80h