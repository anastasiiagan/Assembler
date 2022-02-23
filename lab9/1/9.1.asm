;nasm -felf64 9.1.asm -o 9.1.o && g++ -m64 -o driver.o -c driver.cpp && g++ -m64 driver.o 9.1.o -o 9.1 -no-pie
;RDI, RSI, RDX, RCX, R8, R9

section .text

global diff

diff:					;rdi=char *out, rsi=char *wiersz, rdx = int n
enter 0,0

    inc rdx
    mov rcx, 0

    loop:
		cmp rcx, rdx
		jge end

		movups xmm1, [rsi + rcx]			;tab char - 1char=8bit => rcx*1
		movups xmm0, [rsi + rcx + 1]
		psubsb xmm0, xmm1
		movups [rdi+rcx], xmm0

		inc rcx								;s
		jmp loop

end:
leave
ret
