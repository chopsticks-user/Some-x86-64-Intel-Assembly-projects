; x86 Assembly

section .data
        dec_fm_p: db "%ld", 0xa, 0
        dec_fm_s: db "%ld", 0
section .bss
section .text
        extern scanf
        extern printf

%macro log_i64 1
        lea rdi, [dec_fm_p]
        mov rsi, %1
        xor eax, eax
        call printf
%endmacro

%macro read_i64 1
        lea rdi, [dec_fm_s]
        lea rsi, %1
        xor eax, eax
        call scanf
%endmacro

%macro exit_64 1
        mov rax, 60
        mov rdi, %1
        syscall
%endmacro

global main
main:
        push rbp
        mov rbp, rsp
        sub rsp, 16

        read_i64 qword [rbp-8]

        fact [rbp-8]

        log_i64 rax

        leave
        exit_64 0
