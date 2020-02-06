section .data 
    m1 db "Ingrese Primer NUmero"
    l1 equ $-m1

    m2 db "Ingrese Segundo Numero"
    l2 equ $-m2

    Msm_Mayor db "El numero es mayor"
    lMayor equ $-Msm_Mayor


    Msm_Menor db "El primer numero ingreso debe ser mayor que el Segundo"
    lMenor equ $-Msm_Menor

    Msm_Resta db "La resta es:"
    lResta equ $-Msm_Resta

    espacio1 db "",10
	lespacio1 equ $-espacio1
section .bss
    n1 resb 2
    n2 resb 2
    Resta resb 2
    Mayor resb 2
    Menor resb 2
section .text
    global _start



_start:


%macro escribir 2
	mov eax, 4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro leer 2
	mov eax, 3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
;*******INGRESAR Primer Numero***********	
n:
	escribir m1,l1
	leer n1 ,2
;*******INGRESAR Segundo Numero***********	

	escribir m2,l2
	leer n2 ,2
;*****ProcesoDivision********
    mov al,[n1]
    mov bl,[n2]
    cmp al,bl 
    jg mayor
    jmp menor
mayor:
    escribir Msm_Mayor ,lMayor
    escribir Mayor,1
    escribir espacio1,lespacio1
    jmp resta
    int 80h
menor:
    
    escribir Msm_Menor ,lMenor
    escribir Menor,1
    escribir espacio1,lespacio1
    jmp n
    int 80h



comparar:
    mov al,[n1]
    mov bl,[n2]
    cmp al,bl
    jg mayor
    jmp resta

resta:

    mov ax,[n1]
	mov bx,[n2]
	sub ax,'0'   
	sub bx,'0'
	sub ax,bx
	add ax,'0'
	mov[Resta], ax
    escribir Msm_Resta,lResta
    escribir Resta,1
    jmp comparar
  


    mov eax, 1
	int 80h

