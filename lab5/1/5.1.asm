;nasm -felf32 5.1.asm -o 5.1.o && gcc -m32 -o driver.o -c driver.c && gcc -m32 driver.o 5.1.o -o 5.1
;nasm -felf32 5.1.asm -o 5.1.o && g++ -m32 -o driver.o -c driver.c && g++ -m32 driver.o 5.1.o -o 5.1
;y=ax^3+bx^2+c^x+d
;y=[(ax+b)x+c]x+d

;gdb ctrl+x+2

BITS 32
section .text


global wartosc			;extern "C" double wartosc(double a, double b, double  c, double d, double x);

%define    a    [ebp+8]
%define    b    [ebp+16]
%define    c    [ebp+24]
%define    d    [ebp+32]
%define    x    [ebp+40]

wartosc:
   enter 0,0

   finit			;czyści stos fpu
   
   fld dword  d ;d
   fld dword  c ;c d
   fld dword  b ;b c d
   fld dword  a ;a b c d
   fld dword  x ;x a b c d
   fmulp st1   ; ax b c d
   faddp st1   ; ax+b c d
   
   fld dword  x ;x (ax+b) c d
   fmulp st1   ; (ax^2+bx) c d
   faddp st1   ; (ax^2+bx+c) d
   
   fld dword  x      ;x (ax^2+bx+c) d
   fmulp st1   ; (ax^3+bx^2+cx) d
   faddp st1   ; ax^3+bx^2+cx+d

    leave
    ret
