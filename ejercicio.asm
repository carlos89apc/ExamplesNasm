section .data
    mensaje db "El resulatado es:",10
    len equ $<-mensaje

section .bss
    suma resb 1
section .text
    global _start:

_start:

