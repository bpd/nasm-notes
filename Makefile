
CC = gcc
PLATFORM = win64
CFLAGS = -std=c99 -Wall -pedantic -m64

call-win64.o: call-win64.asm
	nasm -f win64 call-win64.asm -o call-win64.o

call-macho64.o: call-macho64.asm
	nasm -f macho64 call-macho64.asm -o call-macho64.o

main: main.c call-$(PLATFORM).o
	$(CC) $(CFLAGS) main.c call-$(PLATFORM).o -o stage1.exe

clean:
	rm -f test.o stage1.exe

