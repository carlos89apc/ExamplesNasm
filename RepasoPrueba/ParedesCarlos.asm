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
        
section .bss
	respuesta resb 2
	
section .text
		global _start

_start:
	imprimir msj, len_msj
	leer respuesta, 2
	mov al,[respuesta]
	

;division: 
        ;sub al, bl
	    ;inc cx
	    ;cmp al,bl
	    ;jg division
        ;je division
	    ;jmp mostrar

;mostrar: 
	    ;add al,'0'
	    ;add cx,'0'
	    ;mov [cociente], cx
	    ;mov [residuo], al
        ;escribir m1, l1
        ;presentar cociente
        ;escribir m2, l2
        ;presentar residuo
        ;jmp salir
        
	    push eax
	    imprimir msj1,len_msj1 
	    pop eax
	    sub al,'0'
	
	    cmp al,1
	    je Div1
	    cmp al,2
	    je Div2
	    cmp al,3
	    je Div3
	    cmp al,4
	    je Div4
        cmp al,5
        je Div5
        cmp al,6
        je Div6
        cmp al,7
        je Div7
        cmp al,8
        je Div7
        cmp al,9
        je Div9
	
	jmp salir
	
Div1:
    ;add al,'0'
    ;add cx,'0'
	;mov [cociente], cx
	;mov [residuo], al
    imprimir uno,5
    ;presentar residuo
	jmp salir
Div2:
    ;add al,'0'
    ;add cx,'0'
	;mov [cociente], cx
	;mov [residuo], al
    imprimir dos,5
    ;presentar residuo
	jmp salir
Div3:
	;add al,'0'
    ;add cx,'0'
	;mov [cociente], cx
	;mov [residuo], al
    imprimir tres,5
    ;presentar residuo
	jmp salir
Div4:
    ;add al,'0'
    ;add cx,'0'
	;mov [cociente], cx
	;mov [residuo], al
    imprimir cuatro,5
    ;presentar residuo
	jmp salir
Div5:
    ;add al,'0'
    ;add cx,'0'
	;mov [cociente], cx
	;mov [residuo], al
    imprimir cinco,5
    ;presentar residuo
	jmp salir
Div6:
    ;add al,'0'
    ;add cx,'0'
	;mov [cociente], cx
	;mov [residuo], al
    imprimir seis,5
    ;presentar residuo
	jmp salir
Div7:
    ;add al,'0'
    ;add cx,'0'
	;mov [cociente], cx
	;mov [residuo], al
    imprimir siete,5
    ;presentar residuo
	jmp salir
Div8:
    ;add al,'0'
    ;add cx,'0'
	;mov [cociente], cx
	;mov [residuo], al
    imprimir ocho,5
    ;presentar residuo
	jmp salir
Div9:	
    ;add al,'0'
    ;add cx,'0'
	;mov [cociente], cx
	;mov [residuo], al
    imprimir nueve,5
    ;presentar residuo
	jmp salir

salir:
	mov eax,1
	mov ebx,0
	int 80h

section .data
	msj db "Ingrese un número",10
	len_msj equ $-msj
	msj1 db "El numero binario es",10
	len_msj1 equ $-msj1
	 


		uno db 0,'01',0
		dos db 0,'10',0
		tres db 0,'11',0
		cuatro db 0,'100',0
		cinco db 0,'101',0
		seis db 0,'110',0
		siete db 0,'111',0
		ocho db 0,'1000',0
		nueve db 0,'1001',0


