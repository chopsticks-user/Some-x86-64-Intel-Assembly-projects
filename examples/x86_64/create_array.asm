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

        mov ecx, 0
        jmp .l1
.l2:
        mov dword [rbp-20+rcx*4], 11
        add ecx, 1
.l1:
        cmp ecx, 5
        jl .l2

        mov eax, dword [rbp-8]

        lea edi, [dec_fm]
        mov esi, eax
        call printf

        pop rbp
        mov rax, 60
        xor rdi, rdi
        syscall