
CC = gcc

CFLAGS = -std=c99 -Wall -pedantic -m64

test.o: test.asm
	nasm -f win64 test.asm -o test.o

main: main.c test.o
	$(CC) $(CFLAGS) main.c test.o -o stage1.exe

clean:
	rm -f test.o stage1.exe

