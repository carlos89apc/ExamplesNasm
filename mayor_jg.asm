;Jerl

.DATA 0b
		;Numero de comparaciones que hago cada ves que recorro la memoria
		;Si son 100 posiciones de memoria hago 99 comparaciones por recorrido
		NumComparacion: dB 0 
		;Numero de recorridos que hace a la memoria para este caso es igual a 100
		Recorrido: dB 0




;Main
.org 1000h

LXI D, 0100h ; Inicio de la memoria
CALL comparar

;Fin Main

;Compara 2 numeros consecutivos en memoria
comparar:
		INX D 
		LDAX D
		MOV B,A
		DCX D
		LDAX D
		CMP B
		JNC invertir
		JMP comparar2
;Si el primer numero comparado es mayor que el siquiente lo intercambia
invertir:
		INX D 
		STAX D
		DCX D
		MOV A, B
		STAX D
		JMP comparar2
;Comparar 2, compara el numero de si llego al limite de comparaciones en
;un recorrido a las 100 posiciones de memoria
comparar2:
		INX D 
		LDA NumComparacion
		INR A 
		STA NumComparacion
		CPI 99
		JZ increcorido
		JMP comparar
;Incrementar recorrido, dependera de la cantidad de numeros a ordenar en
;memoria. Cada vez que se termina un recorrido, se inicializa el numero de
;comparaciones y aputador a memoria		
increcorido:
		LDA Recorrido
		INR A
		STA Recorrido
		CPI 100
		JZ fin
		LDA NumComparacion
		MVI A, 0
		STA NumComparacion
		LXI D, 0100h
		JMP comparar
		

fin:
		HLT