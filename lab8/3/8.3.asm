;nasm -felf64 8.2.asm -o 8.2.o && g++ -m64 -o driver.o -c driver.cpp && g++ -m64 driver.o 8.2.o -o 8.2 -no-pie

global _Z5zerujPjj, _Z6kopiujPjS_j, _ZN6BigInt5dodajEj, _ZN6BigInt6pomnozEj, _ZN6BigInt14podzielZResztaEj, _ZmiRK6BigIntS1_, _ZplRK6BigIntS1_

segment .text

_Z6kopiujPjS_j:			;rdi=unsigned int * cel;  rsi= unsigned int * zrodlo;  rdx=unsigned int n
	mov ecx, edx
	rep movsd
	ret

_Z5zerujPjj: 			;rdi=unsigned int * tab;  rsi=unsigned int n
	xor rax, rax
	cld
	mov ecx, esi
	rep stosd			;Store EAX at address ES:(E)DI
	ret

_ZN6BigInt5dodajEj:		;rdi=this*;  rsi=unsigned int n
	;push rbp
	;mov rbp, rsp
	
	mov eax, edi	; int rozmiar
	mov rdi, qword [rdi + 8] ;int * dane
	
	mov rcx, 0
	petla_dodaj:
		xor rax, rax	; wyzeruj flagi
		add rax, rax
		
		mov eax, dword [rdi + 4 * rcx] ; dane[i]
		add eax, esi
		mov dword [rdi + 4 * rcx], eax
		
		jno return_0_dodaj ; jesli brak przepelnienie
		mov esi, 1 ; przepelnienie 1
		inc rcx
		cmp ecx, eax
		jl petla_dodaj
		
	mov rax, 1 ; przepelnienie
	ret
	
	return_0_dodaj:
	mov rax, 0
	;pop rbp
	ret

_ZN6BigInt6pomnozEj:	; esi -> n
	push rbp
	mov rbp, rsp
	
	mov eax, dword [rdi]	;
	mov dword [rbp-4], eax	; [rsp-4] = rozmiar
	mov eax, 0
	mov dword [rbp-8], eax ; i = 0;
	mov rdi, qword [rdi + 8] ; rdi = dane
	
	xor rcx, rcx
	
	xor rax, rax	; wyzeruj flagi, of = 0
	add rax, rax
	
	mnoz:	; dodaj n razy
	cmp ecx, dword [rbp-4]	; n razy dodaj
	jge koniec_mnoz
	mov eax, dword [rdi + 4 * rcx] 
	add eax, eax
	mov dword [rdi + 4 * rcx], eax	; dodaj blok
	
	mov dword [rbp-8], ecx	; zapisz i	
	jno next
	inc ecx	; j++
	
	petla_pomnoz: ; przenos jedynke
	cmp ecx, dword [rbp-4] ; j < rozmiar
	jge return_1_pomnoz
	
	xor rax, rax	; wyzeruj flagi, OF = 0
	add rax, rax
	
	mov eax, dword [rdi + 4 * rcx] ; dane[i]
	add eax, 1
	mov dword [rdi + 4 * rcx], eax
	
	jno next
	inc ecx
	cmp ecx, dword [rbp-4] ; i < rozmiar
	jl petla_pomnoz	

	next:
	jno return_1_pomnoz
	mov ecx, dword [rbp-8] ; przywroc i
	
	inc ecx
	jmp mnoz
	
	koniec_mnoz:
	
	mov rax, 0
	pop rbp
	ret
	
	return_1_pomnoz:
	
	mov rax, 1
	pop rbp
	ret
	
_ZN6BigInt14podzielZResztaEj:
	push rbx
	push rbp
	mov rbp, rsp
	
	mov eax, dword [rdi]	
	mov dword [rbp-4], eax	; [rsp-4] = rozmiar
	mov rdi, qword [rdi + 8] ; rdi = dane
	
	xor rcx, rcx
	xor rax, rax 
	xor rdx, rdx
	xor rbx, rbx
	
	mov ecx, dword [rbp-4]
	dec ecx
	mov ebx, esi	; ebx = n
	
	dziel:
	cmp ecx, 0
	jl end_dziel
	
	mov eax, dword [rdi + 4 * rcx]
	div ebx	; edx:eax div ebx = eax, edx:eax mod ebx = edx
	mov dword [rdi + 4 * rcx], eax
	
	dec ecx
	jmp dziel
	
	end_dziel:
	mov eax, edx
	pop rbp	
	pop rbx
	ret

_ZplRK6BigIntS1_:	;+ rdi -> ptr, rsi-> a, rdx ->b
	push rbp
	mov rbp, rsp
	sub rsp, 16
	
	mov qword [rbp-8], rdi
	mov qword [rbp-16], rdx
	
	mov eax, dword [rsi]
	cmp eax, dword [rdx]
	
	jge .next_plus ;  a.rozmiar >= b.rozmiar
	mov rax, rdx
	mov rdx, rsi
	mov rsi, rax ; rsi -> b, rdx-> a 
	
	.next_plus:
	
	mov rdi, qword [rbp-8]
	; rdi-> ptr, rsi-> a lub b
	call _ZN6BigIntC1ERKS_  ; BigInt(const BigInt & x)

	mov rax, qword [rbp-8]
	mov rdi, rax
	mov rsi, qword [rbp-16] ; rdi -> c, rsi -> a lub b
	
	mov eax, dword [rsi]
	mov dword [rbp-4], eax	; [rbp-4] -> rozmiar ktory jest krotszy
	
	;przesun na dane
	mov rdi, [rdi+8]
	mov rsi, [rsi+8]
	
	xor rcx, rcx
	
	.petla
	cmp ecx, dword [rbp-4]
	je koniec_plus
	mov eax, dword [rsi + 4 * rcx]
	adc dword [rdi + 4 * rcx], eax
	inc ecx
	jmp .petla
	koniec_plus:

	jnc no_carry_add
	;dec ecx
	add dword [rdi + 4 * rcx], 1
	no_carry_add:
	
	mov rax, rdi
	
	mov rsp, rbp
	pop rbp
	ret
	 
_ZmiRK6BigIntS1_:	;- rdi -> ptr, rsi-> a, rdx ->b
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov qword [rbp-8], rdi
	mov qword [rbp-16], rdx
	
	mov eax, dword [rsi]
	cmp eax, dword [rdx]
	
	jge next_minus ;  a.rozmiar >= b.rozmiar
	mov rax, rdx
	mov rdx, rsi
	mov rsi, rax ; rsi -> b, rdx-> a 
	
	next_minus:
	
	mov rdi, qword [rbp-8]
	; rdi-> ptr, rsi-> a lub b
	call _ZN6BigIntC1ERKS_  ; BigInt(const BigInt & x)

	mov rax, qword [rbp-8]
	mov rdi, rax
	mov rsi, qword [rbp-16] ; rdi -> c, rsi -> a lub b
	
	mov eax, dword [rsi]
	mov dword [rbp-4], eax	; [rbp-4] -> rozmiar ktory jest krotszy
	
	;przesun na dane
	mov rdi, [rdi+8]
	mov rsi, [rsi+8]
	
	xor rcx, rcx
	cmp ecx, dword [rbp-4]
	je koniec_minus
	mov eax, dword [rsi + 4 * rcx]
	sbb dword [rdi + 4 * rcx], eax
	inc ecx
	koniec_minus:
	
	jnc no_borrow_minus
	;dec ecx
	sub dword [rdi + 4 * rcx], 1
	no_borrow_minus:
	
	mov rax, rdi
	
	mov rsp, rbp
	pop rbp
	ret

