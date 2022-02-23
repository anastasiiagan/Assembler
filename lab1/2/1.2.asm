; wersja NASM na system 64-bitowy (x86-64)
; kompilacja: nasm -felf64 1.2.asm -o 1.2.o
; linkowanie: ld 1.2.o -o 1.2
; linkowanie: ld -m elf_x86_64  hello.o -o hello

section .text            ; początek sekcji kodu.


global _start            ; linker ld domyślnie rozpoczyna
                         ; wykonywanie programu od etykiety _start
                         ; musi ona być widoczna na zewnątrz (global)
_start:                   ; punkt startu programu


 ; print enquiry message
 mov rax, 1          ; numer funkcji systemowej: 1=sys_write - zapisz do pliku
 mov rdi, 1          ; numer pliku, do którego piszemy. 1 = standardowe wyjście = ekran
 mov rsi, enquiry      ; RSI = adres tekstu
 mov rdx, enquiry_len    ; RDX = długość tekstu
 syscall                 ; wywołujemy funkcję systemową


 ; read first number from keyboard
 mov rax, 0
 xor rdi, rdi
 mov rsi, inp1
 mov rdx, inp1_len
 syscall

 ;sub eax, 1 
 ;mov dword [inp1_len], eax ; save number of read bytes
 
 
 ; print enquiry message
 mov rax, 1          ; numer funkcji systemowej: 1=sys_write - zapisz do pliku
 mov rdi, 1          ; numer pliku, do którego piszemy. 1 = standardowe wyjście = ekran
 mov rsi, enquiry      ; RSI = adres tekstu
 mov rdx, enquiry_len    ; RDX = długość tekstu
 syscall                 ; wywołujemy funkcję systemową
 
 ; read second number from keyboard
 mov rax, 0
 xor rdi, rdi
 mov rsi, inp2
 mov rdx, inp2_len
 syscall

 ;sub eax, 1 
 ;mov dword [inp2_len], eax ; save number of read bytes
 
 
 xor rax,rax
 ;count
 mov eax,[inp1]
 sub eax,'0'
 mov ebx,[inp2]
 sub ebx,'0'
 add eax,ebx
 ;add eax,48
 

 
 xor rdx,rdx
 mov ebx, 10
 div ebx
 add eax, 48
 add edx, 48
 
 
 mov [output],al
 mov dword [output_len], 1
 
 mov [output2],dl
 mov dword [output2_len], 1

 
 ; print output - dziesiatki
 mov rax, 1          ; numer funkcji systemowej: 1=sys_write - zapisz do pliku
 mov rdi, 1          ; numer pliku, do którego piszemy 1 = standardowe wyjście = ekran
 mov rsi, output      ; RSI = adres tekstu
 mov edx, [output_len]    ; RDX = długość tekstu
 syscall                 ; wywołujemy funkcję systemową

 
 ; print output - jednosci
 mov rax, 1          ; numer funkcji systemowej: 1=sys_write - zapisz do pliku
 mov rdi, 1          ; numer pliku, do którego piszemy 1 = standardowe wyjście = ekran
 mov rsi, output2     ; RSI = adres tekstu
 mov edx, [output2_len]    ; RDX = długość tekstu
 syscall                 ; wywołujemy funkcję systemową

 

 ; exit with code 0

 mov rax, 60         ; numer funkcji systemowej (60=sys_exit - wyjdź z programu)
 mov rdi, 0          ; RDI - kod wyjścia
 syscall                 ; wywołujemy funkcję systemową


section .data                   ; początek sekcji danych.
 
 enquiry db "Podaj liczbe jedno-cyfrowa: ", 0ah ; wiadomość początkowa
 enquiry_len equ $ - enquiry

	
inp1 times 255 db 0
inp1_len equ $ - inp1    

inp2 times 255 db 0
inp2_len equ $ - inp2    

 ;inp1 times 1 db "X"   ; bufor na input
 ;inp1_len dd 0  ; długość napisu
 
 ;inp2 times 1 db "X"   ; bufor na input
 ;inp2_len dd 0  ; długość napisu
 
 output times 2 db "XX"
 ;output_len equ $ - output
 output_len dd 0
 
 output2 times 2 db "XX"
 ;output_len equ $ - output
 output2_len dd 0
 



