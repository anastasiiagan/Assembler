;nasm -felf32 4.4.asm -o 4.4.o && g++ -m32 -o driver.o -c driver.c && g++ -m32 driver.o 4.4.o -o 4.4

BITS 32
section .data
two dd 2.0

section .bss
MinMax: times 2 resb 4

section .text


global minmax		;minmax( int N, ...)

%idefine    n    [ebp+8]
%idefine    x1    [ebp+12]
%idefine    x2    [ebp+16]
;...

minmax:
   enter 0,0
   
   mov ecx, n
   mov edx, x1
   
   xor eax,eax
   mov [eax], word x1
   mov [eax+4], word x1
   for:
		dec ecx
		jz end
		
		add edx, 4 
		
		
	end:
   
    leave
    ret
