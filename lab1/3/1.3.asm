; wersja NASM na system 64-bitowy (x86-64)
; kompilacja: nasm -felf64 1.3.asm -o 1.3.o
; linkowanie: ld 1.3.o -o 1.3
; linkowanie: ld -m elf_x86_64  hello.o -o hello

section .text            ; początek sekcji kodu.

global _start            ; linker ld domyślnie rozpoczyna
                         ; wykonywanie programu od etykiety _start
                         ; musi ona być widoczna na zewnątrz (global)
_start:                   ; punkt startu programu


 ;create file
 mov rax, 2
 mov rdi, file_path
 mov rsi, 1102o
 mov rdx, 777o
 ;zwraca w eax deskryptor pliku;
 syscall
 
 mov rbx, rax		;deskryptor pliku do rbx
 
 ;print to file
 mov rax, 1                  ; system call for write
 mov rdi, rbx				 ; EBX / RDI = deskryptor pliku (ekran = 1)
 mov rsi, my_text            ; address of string to output
 mov rdx, my_text_len                 ; number of bytes
 syscall                           ; invoke operating system to do the write
 
 ;close file
 mov rax, 3
 mov rdi, rbx
 syscall
          
  
 ; exit with code 0
 mov rax, 60         ; numer funkcji systemowej (60=sys_exit - wyjdź z programu)
 mov rdi, 0          ; RDI - kod wyjścia
 syscall                 ; wywołujemy funkcję systemową


section .data                   ; początek sekcji danych.
 
 my_text db "Anastazja Ganusina", 0ah ; teks do wpisana w plik
 my_text_len equ $ - my_text					; dugosc napisu 
 
 file_path: db 'output.txt',0
 ;file_mode: dq 754

 
 

