; nasm -felf64 1.2.asm -o 1.2.o
; ld 1.2.o -o 1.2

section .data 
  pytanie db "Podaj dwie liczby jednocyfrowe imie: ", 0ah
  pytanie_len equ $ - pytanie
  
  wynik db "wynik: ", 0ah
  wynik_len equ $ - wynik
  
  output db "XX", 0ah
  output_len equ $ - output

section .bss
  a: resb 1
  b: resb 1 

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
  mov rsi, a  
  mov rdx, 2 
  syscall
  
  mov rax, 0 
  mov rdi, 0   
  mov rsi, b  
  mov rdx, 2 
  syscall
  
  xor rax, rax
  mov al, [a]
  sub al, 96
  add al, byte [b]
  
  xor rdx, rdx
  mov rbx, 10
  div rbx
  add al, 48
  add dl, 48
  mov byte [output], al
  mov byte [output+1], dl
  
  
  mov rax, 1 
  mov rdi, 1   
  mov rsi, wynik  
  mov rdx, wynik_len  
  syscall
          
  
  mov rax, 1 
  mov rdi, 1   
  mov rsi, output  
  mov rdx, output_len  
  syscall

  mov rax, 60
  mov rdi, 0 
  syscall 
