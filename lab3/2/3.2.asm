;nasm -felf64 -o 3.2.o 3.2.asm
;gcc -no-pie -o 3.2 3.2.o driver64.o asm64_io.o 
;gcc -no-pie -o 3.1 3.1.o driver64.o asm64_io.o 
%include "asm64_io.inc"    ;odpowiednik dyrektywy #include z C
segment .data
;
a1 dd 1, -2, 3, -4, 5, -6, 7, -8, 9, -10
;a1 dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ;db?	dd for 32 bit?
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
push a1
push 10

call find_max
call print_int

mov eax, 0 ; kod zwracany z funkcji
leave
ret

find_max:
	pop r8		;adres powrotu
	pop rcx		;adres do  wart. ilosci el-ow  w tab
	pop rdx		;adres 1 el-u tab
	push r8
	
	mov eax, [rdx]
	add rdx, 4
	dec rcx
	loop1:
		cmp eax,[rdx]
		jg continue
		mov eax, [rdx]
		continue:
		add rdx, 4
		loop loop1
	ret

