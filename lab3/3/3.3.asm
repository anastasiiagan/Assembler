;nasm -felf64 -o 3.3.o 3.3.asm
;gcc -no-pie -o 3.3 3.3.o driver64.o asm64_io.o 
%include "asm64_io.inc"    ;odpowiednik dyrektywy #include z C
segment .data
;
string_input db "-32", 0

int_input db -32, 0ah

greeting db "Yep, rowna sie", 0
greeting_len equ $ - greeting

ups db "Znowu nie dziala -_-", 0
ups_len equ $ - ups
;~ output times 60 db "X"
;~ output_len dd 0

;~ message times 60 db "X"   ; bufor na input
message_len dd 0  ; długość napisu
;

segment .bss
str_int resb 10
;
;output resb 123
; dane niezainicjalizowane
;

segment .text
global asm_main
asm_main:
enter 0,0         ; setup 


; ----


mov rax, string_input

call to_int

call print_int

;~ cmp rax, [int_input]
;~ jne print_ups

;~ print_greeting:
 ;~ mov rax, 1
 ;~ mov rdi, 1
 ;~ mov rsi, greeting
 ;~ mov rdx, greeting_len
 ;~ syscall
 ;~ jmp end
 
 ;~ print_ups:
 ;~ mov rax, 1
 ;~ mov rdi, 1
 ;~ mov rsi, ups
 ;~ mov rdx, ups_len
 ;~ syscall
 
 

end:
mov eax, 0 ; kod zwracany z funkcji
leave
ret

to_int:
	mov r8, rax
	
	mov rax, 1
	mov r10, 1
	cmp byte[r8], '-'
	jne first_digit
	mov r10, -1
	inc r8
	
	first_digit:
		xor rcx, rcx
		mov cl, byte[r8]
		sub cl, '0'
		xor rdx, rdx
		mul rcx
		inc r8
	
	mov r9, 10
	for1:
		cmp byte[r8], 0
		je for1_end
	
		xor rdx,rdx
		mul r9
		
		xor rcx, rcx
		mov cl, byte[r8]
		sub cl, '0'
		add rax, rcx
		inc r8
		
		jmp for1
	for1_end:
	
	imul r10
	ret

to_string:
	mov r8, rax
	mov rax, str_int
	
	;~ cmp r8, 0
	;~ jge continue
	;~ mov byte[rax], '-'
	;~ inc rax
	
	
	for_str:
		xor 

;~ change_char:
	;~ mov rcx, 0
	;~ loop1:
		;~ cmp al, [s1 + rcx]
		;~ jne continue
		;~ mov al, [s2 + rcx]
		;~ jmp loop1_end
		
		;~ continue:
		;~ inc rcx
		;~ cmp rcx, s1_len
		;~ jb loop1
	;~ loop1_end:
	;~ ret
