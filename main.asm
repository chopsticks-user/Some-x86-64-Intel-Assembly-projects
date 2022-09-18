; x86_64 Intel Assembly
%include "src/math.asm"
%include "src/debug.asm"

section .data
section .bss
section .text
        global _start

_start:
        mov rax, 4
        mul_64 5, 6
        div_64 rax, 4
        deb_64 rax
        deb_64 rax

        mov rax, 60
        xor rdi, rdi
        syscall