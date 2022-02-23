; wersja NASM na system 64-bitowy (x86-64)
; kompilacja: nasm -felf64 2.2.asm -o 2.2.o
; linkowanie: ld 2.2.o -o 2.2
; linkowanie: ld -m elf_x86_64  hello.o -o hello

section .text

global _start            

_start:  

 ;mov r8, number_end
 lea r8, [number_str]
 mov eax, [n_len]
 add r8, rax
 ;add r8, 1
 ;inc r8
 
mov eax, [n]      
mov ecx, [n_len]		; ECX to zmienna I. i=2
petla_for:
	cmp	ecx, 0	;eax do 0		
    jbe	 koniec_petli	; wychodzimy, gdy i >= 0

	xor rdx,rdx
	mov ebx, 10
    div ebx				;dzielimy przez 10
    add edx, '0'
    
    mov byte[r8], dl
    dec r8
    ;sub r8, 1
    
    dec	ecx		        ; i=i-1
    jmp	    petla_for
koniec_petli:
;dec r8

mov eax, [n]
cmp eax, 0
jge make_positive

mov byte[r8], '-'
jmp print_result

make_positive:
mov byte[r8], '+'
 
 
print_result:
 mov rax, 1
 mov rdi, 1
 mov rsi, number_str
 ;mov rsi, number_end
 mov edx, [n_len]
 inc edx
 syscall

 ; exit with code 0
 mov rax, 60 
 mov rdi, 0 
 syscall   


section .data    

 n dd 57, 0ah
 n_len dd 2, 0ah
 
 number_str times 20 db "X" , 0ah  ; bufor na input
 number_end:
 number_str_len dd 0, 0ah  ; długość napisu
 
 symbol dd "X", 0ah

