;nasm -felf64 9.3.asm -o 9.3.o && g++ -m64 -o driver.o -c driver.cpp && g++ -m64 driver.o 9.3.o -o 9.3 -no-pie

section .data
four dd 4.0, 4.0, 4.0, 4.0

section .text
   global scaleSSE

;OUT(i,j) = (IN(2*i,2*j) + IN(2*i +1,2*j) + IN(2*i,2*j + 1) + IN(2*i + 1,2*j + 1))/4

;rdi = float *, rsi = float *IN, rdx = int

scaleSSE:
	enter 0,0

	mov rcx, 0
	mov rax, 0
	lea r11, [rsi + 4*rdx]	;nastepny wiersz
	movups xmm4, [four]
	loop:
		cmp rcx, rdx
		jge end

		movups xmm0, [rsi + 4*rcx]		;D[2*i,2*i]
		movups xmm1, [r11 + 4*rcx]		;D[2*i+1,2*i]
		movups xmm2, [rsi + 4*rcx + 1]	;D[2*i][2*i+1]
		movups xmm3, [r11 + 4*rcx + 1]	;D[2*i][2*i+1]
		
		addps xmm0, xmm1				;D(2*i,2*j)+D(2*i+1,2*j)
		addps xmm2, xmm3				;D(2*i,2*j+1)+D(2*i+1,2*j+1)
		addps xmm0, xmm2				;D(2*i,2*j)+D(2*i+1,2*j) + D(2*i,2*j+1)+D(2*i+1,2*j+1)
		divps xmm0, xmm4
		
		movups [rdi + 4*rax], xmm0
		add rcx, 2
		inc rax
	jmp loop

end:
leave
ret
