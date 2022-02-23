; nasm -felf64 2.1.asm -o 2.1.o
; ld 2.1.o -o 2.1

section .text

global _start


_start: 

  mov rsi, false  
  mov rdx, false_len 
  mov rcx, 2
  mov rax, [n]
  
  for:
	cmp rcx, [n]
	jae for_end
	
	xor rdx, rdx
	div rcx
	
	jz nope
	mov rax, rdx
	inc rcx
	jmp for

  for_end:
  mov rsi, true  
  mov rdx, true_len 
  jmp print_answer
  
  nope:
  mov rsi, false  
  mov rdx, false_len 

  print_answer:  
  mov rax, 1 
  mov rdi, 1    
  syscall

  mov     rax, 60
  mov     rdi, 0 
  syscall 

section .data 
  n dw 57
  
  true db "Jest liczba pierwsza", 0ah
  true_len equ $ - true
  false db "Nie jest liczba pierwsza", 0ah
  false_len equ $ - false

