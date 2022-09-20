; x86_64 Intel Assembly

section .data
        dec_fm: db "%d", 0x0a
section .bss
section .text
        extern printf
        extern scanf

global main
main:
        push rbp
        mov rbp, rsp

        mov ecx, 25
        lea rax, dword [rbp-100]
        jmp .cnd
.lp:
        sub ecx, 1
        mov dword [rax+4*rcx], 72
.cnd:
        test ecx, ecx
        jnz .lp

        lea rsi, dword [rbp-100]
        lea rdi, dword [rbp-200]
        mov rcx, 100
        rep movsb

        lea rdi, [dec_fm]
        mov esi, dword [rbp-8]
        call printf

        pop rbp
        mov rax, 60
        mov rdi, rsi
        syscall
