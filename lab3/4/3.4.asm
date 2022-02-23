;nasm -felf64 -o 3.4.o 3.4.asm
;gcc -no-pie -o 3.4 3.4.o driver64.o asm64_io.o 
%include "asm64_io.inc"    ;odpowiednik dyrektywy #include z C
segment .data
;
s1 db "abcdefghijklmnopqrstuvwxyz",  0ah
s1_len equ $ - s1
s2 db "zyxwvutsrqponmlkjihgfedcba",  0ah
s2_len equ $ - s2
output times 60 db "X"
output_len dd 0

message times 60 db "X"   ; bufor na input
message_len dd 0  ; długość napisu
;

segment .bss
;
;output resb 123
; dane niezainicjalizowane
;

segment .text
global asm_main
asm_main:
enter 0,0         ; setup 


; ----
; read message
 mov rax, 0			;0=odczyt z pliku/klawiatury
 xor rdi, rdi		;wyzerowanie rdi, 0 = standatdowe wejscie = klawiatura 
 mov rsi, message		; RSI = adres name
 mov rdx, 60		;RDX = dlugosc tekstu
 syscall
 
 dec rax				;znak enter
 mov [message_len], rax	;dlugosc wejscia

mov rsi, 0
for1:
	cmp rsi, [message_len]
	je for1_end
	
	mov al, [message+rsi]
	call change_char
	mov byte[output+rsi], al;
	
	inc rsi
	jmp for1
	
for1_end:


;print_output
 mov rax, 1
 mov rdi, 1
 mov rsi, output
 mov rdx, [message_len]
 syscall
 
 


mov eax, 0 ; kod zwracany z funkcji
leave
ret

change_char:
	mov rcx, 0
	loop1:
		cmp al, [s1 + rcx]
		jne continue
		mov al, [s2 + rcx]
		jmp loop1_end
		
		continue:
		inc rcx
		cmp rcx, s1_len
		jb loop1
	loop1_end:
	ret


