;nasm -felf64 -o 2.4.o 2.4.asm
;gcc -o 2.4 2.4.o driver64.o asm64_io.o 
;gcc -no-pie -o 2.4 2.4.o driver64.o asm64_io.o 
;gcc -no-pie helloLM.o -o helloLM

; wersja NASM na system 64-bitowy (x86-64)
; kompilacja: nasm -felf64 2.4.asm -o 2.4.o
; linkowanie: ld 2.4.o -o 2.4

%include "asm64_io.inc"    ;odpowiednik dyrektywy #include z C
segment .data
;
; dane zainicjalizowane
pytanie db "Podaj dwie liczby : ", 0  ; tekst musi kończyć się zerem

a dd 1
b dd 20
 
n dd 9
n_len dd 2
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
mov ebx, [a]
petla_for1:
    mov ecx, ebx
    mov eax, [n]
    petla_for2:
		cmp ecx, 0
		je koniec_petli2
		
		xor rdx, rdx
		div ecx
		
		mov eax, ecx
		mov ecx, edx
		jmp petla_for2
	koniec_petli2:
    
    cmp eax, 1
    jne nie_NWD
    
    xor rax, rax
    mov eax, ebx
    call print_int
    mov al, " "
    call print_char
    
    nie_NWD:
    
	inc ebx
	cmp	    ebx, [b]	
    jae	    koniec_petli1	; wychodzimy, gdy a >= b
	jmp petla_for1
		
koniec_petli1:

; ---

mov eax, 0 ; kod zwracany z funkcji
leave
ret
