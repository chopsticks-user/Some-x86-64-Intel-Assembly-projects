# Makefile for x86_64 Intel Assembly
main: main.asm
	mkdir -p build
	rm -f build/main.o
	rm -f build/main.lst
	rm -f build/main.elf
	nasm -f elf64 -g -F dwarf -o build/main.o -l build/main.lst main.asm
	gcc -nostdlib -no-pie -o build/main.elf build/main.o