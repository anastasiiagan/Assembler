; wersja NASM na system 64-bitowy (x86-64)
; kompilacja: nasm -felf64 2.4.asm -o 2.4.o
; linkowanie: ld 2.4.o -o 2.4
; linkowanie: ld -m elf_x86_64  hello.o -o hello

section .text

global _start            

_start:  
     
mov eax, n 
      
func_NWD:
 mov
 
 
 ;mov ecx, n
 mov ebx, a
petla_for1:
    cmp	    ebx, b	
    jae	    koniec_petli1	; wychodzimy, gdy a >= b
    
    mov ecx, ebx
    mov eax, n
    petla_for2:
		cmp ecx, 0
		je koniec_petli2
		
		xor rdx, rdx
		div ecx
		
		mov eax, ecx
		mov ecx, edx
	koniec_petli2:
	
			;~ for (; b != 0; ) {
                ;~ int c = a % b;
                ;~ a = b;
                ;~ b = c;
            ;~ }
            ;~ return a;
	
    
    cmp eax, 1
    je nie_NWD:
    
    ;can change ecx eax
    ;~ mov eax, ebx
    ;~ petla_while:
		;~ cmp eax, 0
		;~ je koniec_while
		
		;~ xor rdx, rdx
		;~ div 10
		;~ add eax, '0'
		
		
		
	;~ koniec_while:
    
    ;tu ma byc dodanie do str z output wartosc w ebx
    
    nie_NWD:
 
	
	inc ebx
	jmp petla_for1
		
koniec_petli1:


;~ print_result:
 ;~ mov rax, 1
 ;~ mov rdi, 1
 ;~ mov rsi, output
 ;~ mov rdx, output_len
 ;~ syscall

 ; exit with code 0
 mov rax, 60 
 mov rdi, 0 
 syscall   


section .data  

 a dd 1
 b dd 50
 
 n dd 30
 n_len dd 2
 
 output times 100 db "X"
 output_len dd 100
 
