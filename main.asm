; x86_64 Intel Assembly
%include "math.asm"

section .data
section .bss
section .text
        global _start

_start:
        mov edi, 72
        mov esi, 65
        mul_32 edi, esi
        mul_32 eax, 100

        mov eax, 60
        xor edi, edi
        syscall