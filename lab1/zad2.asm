section .text            ; początek sekcji kodu.

global _start    

_start:	
	mov rax, 1
	mov rdi, 1
	mov rsi, tekst
	mov rdx, dlugosc
	syscall
	
	mov rax, 0
    mov rdi, 0
	mov rsi, num_1
	mov rdx, 2
	syscall
	
	mov rax, 1
	mov rdi, 1
	mov rsi, tekst_2
	mov rdx, dlugosc_2
	syscall
	
	mov rax, 0
    mov rdi, 0
	mov rsi, num_2
	mov rdx, 2
	syscall
	
	;=
	xor rax,rax
	mov rax, num_1
	sub rax, '0'
	mov [num_1], al
	
	xor rax,rax
	mov rax, num_2
	sub rax, '0'
	mov [num_2], al
	
	xor rax,rax
	mov rax, num_2
	add rax, num_1
	add rax, '0'
	mov [num_1], al
	
	mov rax, 1
	mov rdi, 1
	mov rsi, num_1
	mov rdx, 1
	syscall
	
	mov rax, 60
	mov rdi, 0
	syscall
	
section .data
	tekst db "Podaj 1 liczbe: "
	dlugosc equ $ - tekst
	
	tekst_2 db "Podaj 2 liczbe: "
	dlugosc_2 equ $ - tekst_2
	
section .bss
	num_1 resb 1
	num_2 resb 1

