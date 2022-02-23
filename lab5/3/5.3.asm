;nasm -felf32 5.3.asm -o 5.2.o && gcc -m32 -o driver.o -c driver.c && gcc -m32 driver.o 5.2.o -o 5.2
;nasm -felf32 5.3.asm -o 5.3.o && g++ -m32 -o driver.o -c driver.c && g++ -m32 driver.o 5.3.o -o 5.3

BITS 32

section .text


global iloczyn_skalarny			;long double iloczyn_skalarny(int n, long double * x, long double * y);

iloczyn_skalarny:
   enter 0,0
   
   mov eax, [ebp+12]
   mov edx, [ebp+16]
   mov ecx, [ebp+8]
   
   finit	;czyści stos fpu
   fldz		;laduj zero
   for:
		fld tword [eax]	;x[i] 0
		fld tword [edx]	;y[i] x[i] 0
		fmulp st1		;y[i]*x[i] 0
		faddp st1		;0+=(y[i]*x[i])

		add eax, 12
		add edx, 12

		dec ecx
		jnz for
	end:

    leave
    ret
    
