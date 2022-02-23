;nasm -felf32 4.2.asm -o 4.2.o && g++ -m32 -o driver.o -c driver.c && g++ -m32 driver.o 4.2.o -o 4.2
BITS 32
section .data
	;~ we1: times 4 db 0
	;~ we2: times 4 db 0
	;~ ;tab: times 4 db 0
	;~ input: db "%d", 0
	;~ output: db "%d", 10, 0
section .text

global iloczyn		;int iloczyn(int n, int * tab);

%define    n    [ebp+8]
%define    tab    [ebp+12]

iloczyn:
enter 0,0
push ebx

mov eax, 1
mov ebx, tab
mov ecx, n

for:
	xor edx, edx
	imul eax, [ebx]
	add ebx, 4
	
	dec ecx
	jnz for

pop ebx
leave
ret
