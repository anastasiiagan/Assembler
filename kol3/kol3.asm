;nasm -felf64 9.2.asm -o 9.2.o && g++ -m64 -o driver.o -c driver.cpp && g++ -m64 driver.o 9.2.o -o 9.2 -fPIE
;nasm -felf64 kol3.asm -o kol3.o && g++ -m64 -o driver.o -c driver.cpp && g++ -m64 driver.o kol3.o -o kol3 -no-pie

section .data
x dd 0
one dd 1.0, 1.0, 1.0, 1.0

section .text
   global oblicz

;w[i] =  x*(x+a[i]) +1

oblicz:						;rdi = int n, xmm0 =  float x,  rsi = float * a, rdx = float *w
	enter 0,0

	mov rcx, 0
	movss [x], xmm0

    loop:
    cmp rcx, rdi
    jge end

    movups xmm0, [rsi + 4*rcx]			;tab float => rcx*4
    movups xmm1, [x]
    shufps xmm1, xmm1, 0x0
    addps xmm0, xmm1
	mulps xmm0, xmm1
	
    movss xmm1, [one]
    addps xmm0, xmm1
    
    movups [rdx+4*rcx], xmm0

    inc rcx
    jmp loop

	
end:
leave
ret

	

