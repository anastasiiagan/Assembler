; wersja NASM na system 64-bitowy (x86-64)
; kompilacja: nasm -felf64 2.1.asm -o 2.1.o
; linkowanie: ld 2.1.o -o 2.1
; linkowanie: ld -m elf_x86_64  hello.o -o hello

section .text

global _start            

_start:  



mov ecx, 2		; ECX to zmienna i. i=2
petla_for:
    cmp	ecx, [n]		
    jae	 koniec_petli	; wychodzimy, gdy i >= n

	mov eax, [n]
	xor rdx,rdx
    div ecx				;dzielimy przez i
    
    cmp edx, 0
    je change_result

    inc	    ecx		        ; i=i+1
    jmp	    petla_for
koniec_petli:
mov rsi, yes
mov rdx, yes_len
jmp print_result

change_result:
 mov rsi, no
 mov rdx, no_len
 

print_result:
 mov rax, 1
 mov rdi, 1
 syscall

 ; exit with code 0
 mov rax, 60 
 mov rdi, 0 
 syscall   


section .data    

 n dd 53
 
 yes db "Jest liczba pierwsza", 0ah
 yes_len equ $ - yes
 
 no db "Nie jest liczba pierwsza", 0ah
 no_len equ $ - no
