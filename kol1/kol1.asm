;nasm -felf32 kol1.asm -o kol1.o && g++ -m32 -o driver.o -c driver.c && g++ -m32 driver.o kol1.o -o kol1

BITS 32

section .data
one dq 1.

section .text

;(((((tab[0]+x)*tab[1]+x)*... +x)*tab[n-1]+x)

global oblicz			;ldouble oblicz( double *tab, int n, float x);

%idefine    tab    		[ebp+8]		;double
%idefine    n   	 	[ebp+12]
%idefine    x    		[ebp+16]

oblicz:
   enter 0,0
   
   mov ecx, n
   mov eax, tab
   
   finit	;czyści stos fpu
   ;fild	qword [one]			;1
   fld1
   for:
		fld qword [eax]		;tab[0] 1
		fmulp st1			;tab[0]
		fld dword x			;tab[0] x
		faddp st1			;tab[0]+x
		
		add eax, 8
		
		dec ecx
		jnz for
	end:

    leave
    ret
