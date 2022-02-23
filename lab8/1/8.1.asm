;nasm -felf64 8.1.asm -o 8.1.o && g++ -m64 -o driver.o -c driver.cpp && g++ -m64 driver.o 8.1.o -o 8.1 -no-pie
section .bss
return resq 1

section .text

global _Z6rotatehi, _Z6rotateji
						
_Z6rotatehi:						    ;rdi=char x rsi= int n
	mov     eax, edi
	mov     ecx, esi
	rol al, cl
	ret

_Z6rotateji:				;rdi=int x rsi= int n
	mov     eax, edi
	mov     ecx, esi
	rol     eax, cl
	ret
