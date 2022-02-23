;nasm -felf64 7.2.asm -o 7.2.o && g++ -m64 -o driver.o -c driver.cpp && g++ -m64 driver.o 7.2.o -o 7.2

; (a*x+b)^n

section .text

global wartosc
wartosc:						    ;xmm0=doube a   ;xmm1=doube b   ;xmm2=doube x   ;rdi= int n
    enter 0,0
    mulpd xmm0, xmm2
    addpd xmm0, xmm1					;11
    
    mov rcx, 1
	for: 
    cmp rcx, rdi
    je end
    
    mulpd xmm0, xmm0

    inc rcx
    jmp for
	end:
	
    leave
    ret

