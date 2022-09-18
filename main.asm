; x86_64 Intel Assembly
%include "src/math.asm"
%include "src/debug.asm"

section .data
section .bss
section .text
        global _start

_start:
        add_64 5, 6
        deb_64_hex rax

        mov rax, 60
        xor rdi, rdi
        syscall