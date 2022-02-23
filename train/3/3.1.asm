; nasm -felf64 3.1.asm -o 3.1.o
; ld 3.1.o -o 3.1

section .text

global _start


_start:
  mov rcx, 0
  for:
	  mov rax, 0 
	  mov rdi, 0   
	  mov rsi, rbx  
	  mov rdx, 2 
	  syscall
	  
	  cmp rbx, '0'
	  je for_end
	  
	  push rbx
	  inc rcx
	  jmp for
	  
  for_end:
  
  mov rax, 0 
  mov rdi, 0   
  mov rsi, rbx  
  mov rdx, 5 
  syscall
  
  mov dword [rdx], 0

  for2:
	  pop rax
	  cmp rax, rbx
	  jge nope
	  inc dword [rdx]
	  
	  nope:
	  dec rcx
	  jnz for2
  
  mov rax, 1 
  mov rdi, 1   
  mov rsi, rdx  
  mov rdx, 2 
  syscall

  mov     rax, 60
  mov     rdi, 0 
  syscall 


