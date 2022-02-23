;nasm -felf64 -o 3.1.o 3.1.asm
;gcc -no-pie -o 3.1 3.1.o driver64.o asm64_io.o 
%include "asm64_io.inc"    ;odpowiednik dyrektywy #include z C
segment .data
;
counter dd 0, 0ah
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

mov ecx, 0
petla_for1:
	call read_int
	
	cmp	eax, 0	
    je koniec_petli1
    
    push rax
    inc ecx
    
	jmp petla_for1
koniec_petli1:

call read_int
mov ebx, eax
mov edx, 0

petla_for2:
	pop rax
	
	cmp eax, ebx
	jae continue
	inc edx 
	
    continue:
    dec ecx
    cmp	ecx, 0	
    je koniec_petli2
    
    
	jmp petla_for2
koniec_petli2:

mov eax, edx
call print_int

; ---

mov eax, 0 ; kod zwracany z funkcji
leave
ret
