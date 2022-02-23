;nasm -felf64 7.1.asm -o 7.1.o && g++ -m64 -o driver.o -c driver.cpp && g++ -m64 driver.o 7.1.o -o 7.1

section .text

global suma
suma:						    ;[rdi]=int n   [rsi]= int tab*
    enter 0,0
    mov rax, 0
    mov rcx, 0
	for: 
		cmp rcx, rdi
		je end
		add rax, [rsi + 4*rcx]
		inc rcx
		jmp for
	end:
    leave
    ret
