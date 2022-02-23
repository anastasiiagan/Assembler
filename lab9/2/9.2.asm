;nasm -felf64 9.2.asm -o 9.2.o && g++ -m64 -o driver.o -c driver.cpp && g++ -m64 driver.o 9.2.o -o 9.2 -fPIE

section .data
skala dw 0

section .text
   global gradientSSE

;GRAD(i,j)= scale * sqrt((DATA(i+1,j)-DATA(i-1,j))2+(DATA(i,j+1)-DATA(i,j-1))2)

gradientSSE:						;rdi = float *grad, rsi = float * data, rdx = int N, xmm0 = float scale
	enter 0,0

	movss [skala], xmm0

	mov rcx, 0
	lea r10, [rsi + 4*rdx]  ;nastepny wiersz
	mov r12, 0
	sub r12, rdx
	lea r11, [rsi + 4*r12]  ;poprzedni wiersz
	;lea r11, [rsi - 4*rdx]  ;poprzedni wiersz
	
   loop:
		cmp rcx, rdx
		jge end

		movups xmm0, [rsi + 4*rcx + 4]		;D[i][i+1]
		movups xmm1, [rsi + 4*rcx - 4]		;D[i][i-1]

		subps xmm0, xmm1					;(D(i,j+1)-D(i,j-1))
		mulps xmm0, xmm0					;(D(i,j+1)-D(i,j-1))^2
		movups xmm2, [r10 + 4*rcx]			;D[i+1,i]
		movups xmm3, [r11 + 4*rcx]			;D[i-1,i]
		subps xmm2, xmm3					;(D(i+1,j)-D(i-1,j)
		mulps xmm2, xmm2					;((D(i+1,j)-D(i-1,j))^2
		addps xmm0, xmm2					;((D(i+1,j)-D(i-1,j))^2+(D(i,j+1)-D(i,j-1))^2
		sqrtps xmm0, xmm0					;sqrt

		movss xmm4, [skala]
		shufps xmm4, xmm4, 0x0
		mulps xmm0, xmm4

		movups [rdi+4*rcx], xmm0
		
       inc rcx
	   jmp loop
	
end:
leave
ret

	
