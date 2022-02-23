;nasm -felf64 kol2.asm -o kol2.o && g++ -m64 -o driver.o -c driver.cpp && g++ -m64 driver.o kol2.o -o kol2 -no-pie

section .bss
return resq 1

section .data
	x_n: times 8 db 0
	podatekNaliczony: times 8 db 0
	
	format_3x_f     db "Faktura %d: obrot %f podatek %f", 0xA, 0
	align 16
	4:      dq      4.0

section .text

global sumuj
sumuj:						    ;[rdi]=x i n   [rsi]=tab*
    enter 0,0					;rdi=x rsi=n rdx=tab* rcx=func*
    
    pop rax
    mov [return], rax
    
    push rcx	;func
    push rdx	;tab
    push rsi	;n
    push rdi	;x
    
    mov rcx, 1
    mov r8, [rsp + 2*8]			;mov rax, tab[0]
    xor r9, r9					;wynik
	for: 
    cmp rcx, rsi
    je end
    
    mov rdi, [rsp]				;x
    mov rsi, [r8 + rcx*4 - 4]	;tab[rcx-1]
    call [rsp + 3*8]
	add r9, rax	
	
    inc rcx
    jmp for
	end:
	
	pop rcx
	pop rcx
	pop rcx
	pop rcx
	
	mov rax, r9
    
    mov rcx, [return]
    push rcx
	
    leave
    ret

%define x dword[rbp-4]
%define n dword[rbp-8]
%define suma dword[rbp-12]

section .text
sumuj:
	enter 16,0			;rownoznaczne enter 0,0 i sub rbp,16
	mov x, xmm0
	mov n, edi
	mov suma, 0
	push rbx
	push r13
	push r14
	push r15
	
	mov rbx, rdx		;fun
	mov r13, rsi		;a
	mov r12, rdi		;n
	
	.loop:
	
	mov rdi, [r13]
	mov xmm0, x
	call rbx
	mov xmm1, suma
	addss xmm1, xmm0
	movss suma, xmm1
	
	add r13, 4
	sub r12, 1
	jnz .loop
	
	movss xmm0, suma
	
	pop r15
	pop r14
	pop r13
	pop rbx
	
	leave
	ret
	
