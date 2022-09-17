# Makefile for x86_64 Intel Assembly
main: main.o
	gcc -nostdlib -no-pie -o main main.o
main.o: main.asm
	nasm -f elf64 -g -F dwarf main.asm -l main.lst