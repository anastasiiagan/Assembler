; wersja NASM na system 64-bitowy (x86-64)
; kompilacja: nasm -felf64 1.1.asm -o 1.1.o
; linkowanie: ld 1.1.o -o 1.1
; linkowanie: ld -m elf_x86_64  hello.o -o hello

section .text            ; początek sekcji kodu.

global _start            ; linker ld domyślnie rozpoczyna
                         ; wykonywanie programu od etykiety _start
                         ; musi ona być widoczna na zewnątrz (global)
_start:                   ; punkt startu programu


 ; print message
 mov rax, 1          ; numer funkcji systemowej: 1=sys_write - zapisz do pliku
 mov rdi, 1          ; numer pliku, do którego piszemy. 1 = standardowe wyjście = ekran
 mov rsi, hello_msg      ; RSI = adres tekstu
 mov rdx, hello_len    ; RDX = długość tekstu
 syscall                 ; wywołujemy funkcję systemową


 ; read name from keyboard
 mov rax, 0			;0=odczyt z pliku/klawiatury
 xor rdi, rdi		;wyzerowanie rdi, 0 = standatdowe wejscie = klawiatura 
 mov rsi, name		; RSI = adres name
 mov rdx, 60		;RDX = dlugosc tekstu
 syscall

 ;sub eax, 1 
 mov dword [name_len], eax ; przepisujemy dlugosc imienia jako wartosc name_len


; print greeting
 mov rax, 1          ; numer funkcji systemowej: 1=sys_write - zapisz do pliku
 mov rdi, 1          ; numer pliku, do którego piszemy 1 = standardowe wyjście = ekran
 mov rsi, greeting      ; RSI = adres tekstu
 mov edx, 6    ; RDX = długość tekstu
 syscall

 
 ; print name
 mov rax, 1          ; numer funkcji systemowej: 1=sys_write - zapisz do pliku
 mov rdi, 1          ; numer pliku, do którego piszemy 1 = standardowe wyjście = ekran
 mov rsi, name      ; RSI = adres tekstu
 mov edx, [name_len]    ; RDX = długość tekstu
 syscall                 ; wywołujemy funkcję systemową
 


 ; exit with code 0
 mov rax, 60         ; numer funkcji systemowej (60=sys_exit - wyjdź z programu)
 mov rdi, 0          ; RDI - kod wyjścia
 syscall                 ; wywołujemy funkcję systemową


section .data                   ; początek sekcji danych.
 
 hello_msg db "Please type your name: ", 0ah ; wiadomość początkowa
 hello_len equ $ - hello_msg					; dugosc napisu poczatkowego

 greeting db 'Witaj ', 0ah ;60 dup('X');
 greeting_len equ $ - greeting


 name times 60 db "X"   ; bufor na input
 name_len dd 0  ; długość napisu
 
 

