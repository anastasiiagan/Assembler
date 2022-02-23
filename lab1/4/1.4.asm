; wersja NASM na system 64-bitowy (x86-64)
; kompilacja: nasm -felf64 1.4.asm -o 1.4.o
; linkowanie: ld 1.4.o -o 1.4


section .text            ; początek sekcji kodu.

global _start 
_start:                   ; punkt startu programu


 ;read date time
 mov rax, 201	;wczytanie czasu systemowego sys_time
 mov rdi, time	;do time ma byc przekazana kopia buforu
 syscall
 ;Zwraca w EAX liczbę sekund która upłynęła od 1 stycznia 1970 roku (minus 1) 
 

;zerowanie EDX/RDX
;zliczanie i zapisanie sekund
 xor rdx,rdx
 mov ebx, 10
 div ebx
 add edx, 48
 mov byte[output+7], dl;
  
 xor rdx,rdx
 mov ebx, 6
 div ebx
 add edx, 48
 mov byte[output+6], dl;
 
 
;zliczanie i zapisanie minut
 xor rdx,rdx
 mov ebx, 10
 div ebx
 add edx, 48
 mov byte[output+4], dl;
  
 xor rdx,rdx
 mov ebx, 6
 div ebx
 add edx, 48
 mov byte[output+3], dl;
 
 
 ;zliczanie i zapisanie godzin
 xor rdx,rdx
 mov ebx, 24
 div ebx
 
 mov rax,rdx
 xor rdx,rdx
 mov ebx, 10
 div ebx
 add edx, 48
 add eax, 48
 mov byte[output+1], dl;
 mov byte[output], al;

 mov rax, 1
 mov rdi, 1
 mov rsi, output
 mov rdx, output_len
 syscall 


 ; exit with code 0
 mov rax, 60 
 mov rdi, 0
 syscall
 
section .data

 output db "XX:XX:XX", 0ah
 output_len equ $ - output
 				
 time:   dq      0
 time_len dd 0
 
 
 
 
 


