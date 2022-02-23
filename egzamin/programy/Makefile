
.PHONY: all clean

all: poly sumuj przetworz

poly: poly.cpp poly.asm
	nasm -felf64 poly.asm -o poly_a.o
	g++ -no-pie  -fno-devirtualize -c poly.cpp -o poly.o
	g++ -no-pie  -fno-devirtualize poly.o poly_a.o -o poly

sumuj: sumuj.asm sumuj.c
	gcc -no-pie -m32 -c sumuj.c -o sumuj_c.o
	nasm -felf sumuj.asm -o sumuj_a.o
	gcc -no-pie -m32 sumuj_c.o sumuj_a.o -o sumuj

przetworz: przetworz.asm przetworz.cpp
	g++ -mavx -no-pie -c przetworz.cpp -o przetworz_c.o
	nasm -felf64 przetworz.asm -o przetworz_a.o
	g++ -mavx -no-pie przetworz_c.o przetworz_a.o -o przetworz

clean:
	rm -f *.o poly sumuj przetworz
