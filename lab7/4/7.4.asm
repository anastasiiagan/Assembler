;nasm -felf64 7.4.asm -o 7.4.o && g++ -m64 -o driver.o -c driver.cpp && g++ -m64 driver.o 7.4.o -o 7.4 -no-pie
section .bss
return resq 1

section .data
	id: times 8 db 0
	podatekNaliczony: times 8 db 0
	
	format_3x_f     db "Faktura %d: obrot %f podatek %f", 0xA, 0
	align 16
	4:      dq      4.0
	

segment .text


global podatek
global wypisz

extern printf

podatek:								;(obrót - podatekNaliczony) * stawkaPodatku
	mov [id], rdi						;rdi = int id oraz float obrot, xmm0=podatekNal  oraz stawkaPod
	movsd [podatekNaliczony], xmm0

	movss xmm0, [id+4]					;obrot
	movss xmm1, [podatekNaliczony]		;podN
	movss xmm2, [podatekNaliczony+4]	;stawkaPod
	subss xmm0, xmm1
	mulss xmm0, xmm2
	ret
	
wypisz:
	sub     rsp, 8
	mov r10, rdi			;faktura
	
	mov rdi, [r10]			;id i obrot
	movsd xmm0, [r10+8]		;podatekNaliczony i stawkaPodatku
	call podatek
	
	mov rsi, [r10]			;id		;2nd integer argument
	cvtss2sd  xmm1, xmm0        	; 2nd floating-point argument
	cvtss2sd  xmm0, [r10+4]         ; 1st floating-point argument
	lea     rdi, [format_3x_f]      ; 1st integer/pointer argument
	mov     al, 3                   ; three floating-point arguments
	call    printf wrt ..plt

	add     rsp, 8
	sub     rax, rax
	ret
	


