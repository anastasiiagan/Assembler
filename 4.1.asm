section .data
	we1: times 4 db 0
	we2: times 4 db 0
	;tab: times 4 db 0
	input: db "%d", 0
	output: db "%d", 10, 0
section .text
extern scanf
extern printf

global main
main:

enter 0,0
push ebx

push we1
push input
call scanf

push we2
push input
call scanf

mov ebx, 0
mov eax, dword[we1]
mov edi, dword [we2]
cdq		; rozszerza rejestry doczytaj
idiv edi

push eax
push output
call printf

xor eax, eax
leave
ret

