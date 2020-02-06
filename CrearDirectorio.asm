%macro escribir 2
  mov eax, 4
  mov ebx, 1
  mov ecx, %1
  mov edx, %2
  int 80h
%endmacro

%macro leer 2
  mov eax, 3
  mov ebx, 0
  mov ecx, %1
  mov edx, %2
  int 80h
%endmacro

section .data
  mjs db 10, 'Carperta o directorio creado', 10
  lenMsj equ $ -mjs
  
  msjPath db 'Ingrese el directorio donde quiere guardar : '
  lenPath equ $ -msjPath

  msArchivo db 'Ingrese direccion del Archivo y su nombre'
  lArchivo  equ $ -msArchivo

section .bss
  
  path resb 50
  archivo resb 80

section .text
  global _start 

_start:

CrearCarpeta:

  escribir msjPath, lenPath
  leer path, 50

  mov eax, 39      ;servicio para crear un directorio
  mov ebx, path  ;Define la ruta del servicio
  mov ecx, 0x1FF   ;Definir el permiso 777
  int 80h
  
  escribir mjs, lenMsj
  jmp CrearArchivo


CrearArchivo:
  escribir msArchivo,lArchivo
  leer archivo,80

  
  mov eax, 8      ;servicio para crear un directorio
;  mov ebx, path  ;Define la ruta del servicio
  mov ebx, archivo
  mov ecx, 0x1FF   ;Definir el permiso 777

  int 80h 
  
  escribir mjs, lenMsj

  jmp salir


salir:
  mov eax, 1
  int 80h