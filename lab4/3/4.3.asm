;nasm -felf32 4.3.asm -o 4.3.o && g++ -m32 -o driver.o -c driver.c && g++ -m32 driver.o 4.3.o -o 4.3
BITS 32
section .data
section .text

global sortuj	;int*x, int*y, int*z

%define    x    [ebp+8]
%define    y    [ebp+12]
%define    z    [ebp+16]

sortuj:
enter 0,0
push ebx

mov eax, dword x
mov ebx, dword y
mov edx, dword z

cmp eax, ebx
jg comAD
xchg eax, ebx

comAD:
cmp eax, edx
jg comBD
xchg eax, edx

comBD:
cmp ebx, edx
jg end
xchg ebx, edx

end:
mov ecx, [ebp+8]
mov [ecx], eax
mov ecx, [ebp+12]
mov [ecx], ebx
mov ecx, [ebp+16]
mov [ecx], edx
pop ebx
leave
ret

