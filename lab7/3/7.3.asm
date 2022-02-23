;nasm -felf64 7.3.asm -o 7.3.o && g++ -m64 -o driver.o -c driver.cpp && g++ -m64 driver.o 7.3.o -o 7.3 -no-pie
section .bss
return resq 1

section .text

global iloczyn						
iloczyn:						    ;rdi=n rsi,rdx,rcx,r8,..r11			extern "C" int iloczyn (int n, ...);
    enter 0,0
    
    pop rax
    mov [return], rax
								;rdi=4 rsi=1 rdx=2 rcx=3 r8=4
    ;push r9				 ;R9, R8, RCX, RDX, RSI 
    push r8
    push rcx
    push rdx
    push rsi
    
    mov rcx, 1
    mov rax, [rsp]			;rdx=rsi=[rsp]
	for: 
    cmp rcx, rdi
    je end
    
    imul rax, [rsp + rcx*8]

    inc rcx
    jmp for
	end:
	
	pop rcx
	pop rcx
	pop rcx
	pop rcx
    ;pop rcx
    
    mov rcx, [return]
    push rcx
	
    leave
    ret

