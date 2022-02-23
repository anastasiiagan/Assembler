;nasm -felf32 5.2.asm -o 5.2.o && gcc -m32 -o driver.o -c driver.c && gcc -m32 driver.o 5.2.o -o 5.2
;nasm -felf32 5.2.asm -o 5.2.o && g++ -m32 -o driver.o -c driver.c && g++ -m32 driver.o 5.2.o -o 5.2
;nasm -felf64 -o 5.2.o 5.2.asm
;ld 5.2.o -o 5.2

;v=abc=objetosc
;P=2ab+2bc+2ac=2(ab+bc+ac)=2(c(a+b)+ab)

BITS 32
section .data
two dd 2.0

section .text


global prostopadloscian			;void prostopadloscian(float a, float b, float c, float * objetosc, float * pole);

%define    a    [ebp+8]
%define    b    [ebp+12]
%define    c    [ebp+16]
%define    objetosc     [ebp+20]
%define    pole		    [ebp+24]

prostopadloscian:
   enter 0,0

   finit			;czyści stos fpu
   
   fld dword  [two] ;d
   fld dword  c ;c 2
   fld dword  b ;b c 2
   fld dword  a ;a b c 2
   faddp st1   ; a+b c 2
   fmulp st1   ; (a+b)c 2
   
   fld dword  b ;b (a+b)c 2
   fld dword  a ;a b (a+b)c 2
   fmulp st1   ; ab (a+b)c 2
   faddp st1   ; [ab+(a+b)c] 2
   fmulp st1   ; [ab+(a+b)c]2
   
   mov eax, [ebp+24]
   fstp dword [eax]
   
   fld dword  c ;c
   fld dword  b ;b c
   fld dword  a ;a b c
   fmulp st1   ; ab c
   fmulp st1   ; abc
   
   
   mov eax, [ebp+20]
   fstp dword [eax]

    leave
    ret
