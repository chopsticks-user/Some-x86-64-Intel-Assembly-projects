global _start

section .data
        message: dw 'Assembly', 10

section .text
_start:
        mov rax, 1
        mov rdi, 1
        mov rsi, message
        mov rdx, 14
        syscall

        mov rax, 60
        xor rdi, rdi
        syscall
