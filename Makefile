
CC = gcc
PLATFORM = win64
CFLAGS = -std=c99 -Wall -pedantic -m64

call-win64.o: call-win64.asm
	nasm -f win64 call-win64.asm -o call-win64.o

# * macho64 needs '_' prefix to all external symbols to be able to link to C
# * using '--prefix _' nasm option handles the underscore issue on the nasm side,
#   alternatively on the C side GCC could be compiled with -fno-leading-underscore
call-macho64.o: call-systemv.asm
	nasm -f macho64 --prefix _ call-systemv.asm -o call-macho64.o

call-elf64.o: call-systemv.asm
	nasm -f elf64 call-systemv.asm -o call-elf64.o

main: main.c call-$(PLATFORM).o
	$(CC) $(CFLAGS) main.c call-$(PLATFORM).o -o stage1.exe

clean:
	rm -f test.o call-$(PLATFORM).o stage1.exe

