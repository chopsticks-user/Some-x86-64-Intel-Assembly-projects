; x86_64 Intel Assembly

%include "include/math.inc"

section .data
        dec_fm: db "%d", 0x0a
section .bss
section .text
        extern printf

global main
main:
        push rbp
        mov rbp, rsp

        fib_64 500

        lea rdi, [dec_fm]
        mov rsi, rax
        call printf

        pop rbp
        mov rax, 60
        xor rdi, rdi
        syscall