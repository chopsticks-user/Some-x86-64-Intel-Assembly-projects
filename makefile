# Makefile for x86_64 Intel Assembly

Application: Application.cpp
	mkdir -p build
	rm -f build/Application

	g++ -std=c++17 -Wall -S -fverbose-asm -g -o build/Application.asm Application.cpp
	g++ -g -o build/Application Application.cpp

	clear

main: main.asm
	mkdir -p build
	rm -f build/main.o
	rm -f build/main.lst
	rm -f build/main
	
	nasm -f elf64 -g -F dwarf -o build/main.o -l build/main.lst main.asm
	gcc -nostdlib -no-pie -o build/main build/main.o

	clear

# asbuild () {
#     as --32 -o build/$1.o $1.asm
# }

# asrun () {
#     gcc -m32 -nostdlib -o build/$1.elf $1.o
# }

# arm-linux-gnueabihf-as -g -o main.o main.asm
# arm-linux-gnueabihf-gcc -g -o main.elf main.o -nostdlib

