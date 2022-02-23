; nasm -felf64 1.1.asm -o 1.1.o
; ld 1.1.o -o 1.1

section .text

global _start


_start: 
  mov rax, 1 
  mov rdi, 1   
  mov rsi, pytanie  
  mov rdx, pytanie_len  
  syscall
  
  mov rax, 0 
  mov rdi, 0   
  mov rsi, imie  
  mov rdx, 20 
  syscall
  
  mov rax, 1 
  mov rdi, 1   
  mov rsi, tekst  
  mov rdx, tekst_len  
  syscall
          
  mov rax, 1 
  mov rdi, 1   
  mov rsi, imie  
  mov rdx, 20  
  syscall

  mov     rax, 60
  mov     rdi, 0 
  syscall 

section .data 
  pytanie db "Podaj swoje imie: ", 0ah
  pytanie_len equ $ - pytanie
  tekst db "Czesc", 0ah
  tekst_len equ $ - tekst

section .bss
  imie: resb 20 
