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
	m1 db 'Ingresar Primer Numero',0xA
	l1 equ $-m1
    m2 db 'Ingresar Segundo Numero',0xA
	l2 equ $-m2
    m3 db 'Ingresar Tercero Numero',0xA
	l3 equ $-m3
    m4 db 'Ingresar Cuarto Numero',0xA
	l4 equ $-m4
    m5 db 'Ingresar Quinto Numero',0xA
	l5 equ $-m5
	msj_p db 'Primero  numero mayor',0xA
	len_p equ $-msj_p
	msj_s db 'Segundo numero mayor',0xA
	len_s equ $-msj_s
	msj_t db 'Tercero  numero mayor',0xA
	len_t equ $-msj_t
    msj_c db 'Cuarto  numero mayor',0xA
	len_c equ $-msj_c
    msj_q db 'Quinto  numero mayor',0xA
	len_q equ $-msj_q

    new_line db ':',10

section .bss
		n1 resb  5
		n2 resb  5
		n3 resb  5
        n4 resb  5
        n5 resb  5
section .text
	global _start
	
_start:
	
    escribir m1,l1
    leer n1,5   
	
    escribir m2,l2
    leer n2,5   

    escribir m3,l3
    leer n3,5   

    escribir m4,l4
    leer n4,5  

    escribir m5,l5
    leer n5,5  



	mov eax,[n1]
	mov ebx,[n2]
	mov ecx,[n3]
    mov edx,[n4]
	


	cmp eax,ebx
	jg compare
	jmp compare2


compare:
	cmp eax,ecx
	jg primermayor
	jmp terceromayor
	
compare2:
	cmp ebx,ecx
	jg segundomayor
	jmp terceromayor
 


	
primermayor:

    escribir msj_p,len_p
	mov eax,1
	int 80h

segundomayor:
    escribir msj_s,len_s
	mov eax,1
	int 80h
	
terceromayor:
    escribir msj_t,len_t
    mov eax,1
    int 80h

cuartomayor:
    escribir msj_c,len_c
    int 80h

quintomayor:
    escribir msj_q,len_q
    int 80h



salir:
	mov eax, 1
	int 80h

