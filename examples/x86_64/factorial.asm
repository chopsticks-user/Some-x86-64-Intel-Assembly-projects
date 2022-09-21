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

global factorial
factorial:
        cmp edi, 1
        jle .case01
        mov eax, 2
        mov ecx, edi
        jmp .loop_cond          ; n >= 2

.loop_exec:
        imul rax, rcx
        dec ecx

.loop_cond:
        cmp ecx, 2
        jg .loop_exec
        ret

.case_neg:
        xor eax, eax            ; return 0 if n < 0
        ret

.case01:
        cmp edi, 0              ; return 1 if n > 0 && n <= 1
        jl .case_neg
        mov eax, 1
        ret

global main
main:
        push rbp
        mov rbp, rsp
        sub rsp, 16

        read_i64 qword [rbp-8]

        mov rdi, qword [rbp-8]
        call factorial

        log_i64 rax

        leave
        exit_64 0
