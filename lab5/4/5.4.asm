;nasm -felf32 5.3.asm -o 5.2.o && gcc -m32 -o driver.o -c driver.c && gcc -m32 driver.o 5.2.o -o 5.2
;nasm -felf32 5.4.asm -o 5.4.o && g++ -m32 -o driver.o -c driver.c && g++ -m32 driver.o 5.4.o -o 5.4

;y=a*(sin(P*2*pi*x))2 + b*(sin(Q*2*pi*x))2

BITS 32
section .data
one dq 1.
step dq 0.
;dwa dq 2.
P2pi dd 2.
Q2pi dq 0.

section .text

global tablicuj			;void tablicuj(double a, double b, double P, double Q, double xmin, double xmax, int k,  double * wartosci);

%idefine    a    		[ebp+8]		;double
%idefine    b   	 	[ebp+16]
%idefine    P    		[ebp+24]
%idefine    Q    		[ebp+32]
%idefine    xmin    	[ebp+40]
%idefine    xmax    	[ebp+48]
%idefine    k       	[ebp+56]
%idefine    wartosci	[ebp+60]
;a=-1 b=1 P=1 Q=2 min=0 max=1 r=30

tablicuj:
   enter 0,0
   
   finit
   
   fld qword xmax ; xmax
   fld qword xmin ; xmin xmax
   fsubp st1 ; xmax-xmin
   fild dword k ;  k xmax-xmin
   fld qword [one]  ; 1 k xmax-xmin
   fsubp st1 ; k-1 xmax-xmin
   fdivp st1 ; (xmax-xmin)/(k-1) 
   fstp qword [step]		;ma byc 0,0344827586206897
   
   fldpi	;pi
   fild qword [P2pi]	;2. pi
   fmulp st1	;2pi				;6.28
   
   fld qword P	;P 2pi
   fmul st1		;P2pi 2pi			;15.56
   fstp qword [P2pi]
   
   fld qword Q	;Q 2pi
   fmulp st1	;Q2pi
   fstp qword [Q2pi]
   
   mov ecx, k
   for:
		fld qword xmin		;xmin
		fild qword [P2pi]	;P2pi x
		fmulp st1			;P2pix
		fsin				;sin(P2pi)
		fmul st0			;sin(P2pi)^2
		fld qword a         ;a sin(P2pi)^2
		fmulp st1			;asin(P2pi)^2
		
		fld qword xmin		;x asin(P2pi)^2
		fild qword [Q2pi]	;x Q2pi asin(P2pi)^2
		fmulp st1			;Q2pix asin(P2pi)^2
		fsin				;sin(Q2pi) asin(P2pi)^2
		fmul st0			;sin(Q2pi)^2 asin(P2pi)^2
		fld qword b         ;b sin(Q2pi)^2 asin(P2pi)^2
		fmulp st1			;bsin(Q2pi)^2 asin(P2pi)^2
		
		faddp st1			;bsin(Q2pi)^2+asin(P2pi)^2 x
		
		mov edx, [ebp + 60]
		mov eax, k
		sub eax, ecx
		fstp qword [edx + 8*eax]
		
		fld qword xmin
		fld dword [step]	;step xmin
		faddp st1			;step+xmin=new_x
		fst qword xmin
		
		dec ecx
		jnz for

    leave
    ret
    

;~ section .data
;~ step dq  0
;~ dwa  dq  2
;~ i    dd  0
;~ one  dq  1.

;~ BITS 32
;~ section .text


;~ global tablicuj
;~ %idefine    a           [ebp+8]
;~ %idefine    b           [ebp+16]
;~ %idefine    P           [ebp+24]
;~ %idefine    Q           [ebp+32]
;~ %idefine    xmin        [ebp+40]
;~ %idefine    xmax        [ebp+48]
;~ %idefine    k           [ebp+56]
;~ %idefine    wartosci    [ebp+60]

;~ tablicuj:
    ;~ enter 0,0
    
    ;~ finit
    ;~ fld qword xmax ; xmax
    ;~ fld qword xmin ; xmin, xmax
    ;~ fsubp st1 ; xmax - xmin
    ;~ fild dword k ;  k, xmax - xmin
    ;~ fld qword [one]  ; 1, k, xmax - xmin
    ;~ fsubp st1 ; k - 1, xmax - xmin
    ;~ fdivp st1 ; (xmax - xmin) / (k - 1) = step
;~ bre:    
    ;~ fstp qword [step]
    ;~ finit

;~ main_loop:
    ;~ mov ecx, k
    ;~ cmp [i], ecx
    ;~ je end

    ;~ finit
    
    ;~ fld qword xmin
    
    ;~ ;fld st0       ;kopia x      ;x x

    ;~ fldpi                       ;pi x x
    ;~ fild qword [dwa]            ;2 pi x x
    ;~ fld qword P                 ;P 2 pi x x
    ;~ fmulp st1                   ;2*P pi x x
    ;~ fmulp st1                   ;2*P*pi x x
    ;~ fmul st1                    ;2*P*pi*x x
    ;~ fsin                        ;sin(2*P*pi*x) x
    ;~ fmul st0                    ;(sin(2*P*pi*x))^2 x
    ;~ fld qword a                 ;a (sin(2*P*pi*x))^2 x
    ;~ fmulp st1                   ;a*(sin(2*P*pi*x))^2 x

    ;~ fldpi                       ;pi a*(sin(2*P*pi*x))^2 x
    ;~ fild qword [dwa]            ;2 pi  a*(sin(2*P*pi*x))^2 x
    ;~ fld qword Q                 ;Q 2 pi a*(sin(2*P*pi*x))^2 x
    ;~ fmulp st1                   ;Q*2 pi a*(sin(2*P*pi*x))^2 x
    ;~ fmulp st1                   ;Q*2*pi a*(sin(2*P*pi*x))^2 x
    ;~ fmul st0, st2               ;Q*2*pi*x a*(sin(2*P*pi*x))^2
    ;~ fsin                        ;sin(2*Q*pi*x) a*(sin(2*P*pi*x))^2
    ;~ fmul st0                    ;(sin(2*Q*pi*x))^2 a*(sin(2*P*pi*x))^2
    ;~ fld qword b                 ;b (sin(2*Q*pi*x))^2 a*(sin(2*P*pi*x))^2
    ;~ fmulp st1                   ;b*(sin(2*Q*pi*x))^2 a*(sin(2*P*pi*x))^2

    ;~ faddp st1                   ;b*(sin(2*Q*pi*x))^2 + a*(sin(2*P*pi*x))^2

    ;~ ;teraz wynik powinien byc w st0
    ;~ mov edx, [ebp + 60]
    ;~ mov eax, [i]
    ;~ fstp qword [edx + 8*eax]

    ;~ inc dword [i]
    ;~ fld qword [step]	;step xmin
	;~ faddp st1			;step+xmin=new_x
	;~ fst qword xmin
    ;~ jmp main_loop

;~ end:
    ;~ leave
    ;~ ret
