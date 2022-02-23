;nasm -felf64 8.2.asm -o 8.2.o && g++ -m64 -o driver.o -c driver.cpp && g++ -m64 driver.o 8.2.o -o 8.2 -no-pie
section .bss
return resq 1

section .text

global _Z6kopiujPjS_j, _Z5zerujPjj
						
_Z6kopiujPjS_j:						;rdi=unsigned int * cel;  rsi= unsigned int * zrodlo;  rdx=unsigned int n
	mov ecx, edx
	rep movsd
	
	ret

_Z5zerujPjj:						;rdi=unsigned int * tab;  rsi=unsigned int n
	xor rax, rax
	cld
	
	mov ecx, esi
	rep stosd				;Store EAX at address ES:(E)DI

	ret
