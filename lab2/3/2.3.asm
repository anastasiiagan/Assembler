;nasm -felf64 -o 2.3.o 2.3.asm
;gcc -no-pie -o 2.3 2.3.o driver64.o asm64_io.o 

%include "asm64_io.inc"    ;odpowiednik dyrektywy #include z C
segment .data
;
; dane zainicjalizowane
n dd 24
k dd 2
n_len dd 2
slowo dd " po petli ", 0ah
;

segment .bss
;
; dane niezainicjalizowane
;

segment .text
global asm_main
asm_main:
enter 0,0         ; setup 


; ----
mov ebx, [n]
mov ecx, 2

petla_for1:
	cmp	ebx, 1	
    jle koniec_petli1

	xor rax, rax
    mov eax, ebx
    
    
    petla_for2:
		xor rdx, rdx
		div ecx
		
		cmp edx, 0
		jne koniec_petli2
		
		mov ebx, eax
		
		mov eax, ecx
		call print_int
		mov al, " "
		call print_char
		
		mov eax, ebx
		jmp petla_for2
	koniec_petli2:
	
    inc ecx
	jmp petla_for1
		
koniec_petli1:

; ---

mov eax, 0 ; kod zwracany z funkcji
leave
ret
