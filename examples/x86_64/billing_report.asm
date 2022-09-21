; x86 Assembly

section .data
        str_fmt_s: db "%s", 0
        str_fmt_p: db "%s", 10, 0
        dec_fmt_s: db "%ld", 0
        dec_fmt_p: db "%ld", 10, 0
        customer_name: db "", 0
section .bss
section .text
        extern scanf
        extern printf

%macro log_i64 1
        lea rdi, [dec_fmt_p]
        mov rsi, %1
        xor eax, eax
        call printf
%endmacro

%macro log_str 1
        lea rdi, [str_fmt_p]
        lea rsi, %1
        xor eax, eax
        call printf
%endmacro

%macro read_i64 1
        lea rdi, [dec_fmt_s]
        lea rsi, %1
        xor eax, eax
        call scanf
%endmacro

%macro read_str 1
        lea rdi, [str_fmt_s]
        lea rsi, %1
        xor rax, rax
        call scanf
%endmacro

global cost
cost:
        cmp rdi, 1000
        jle .le1000
        mov rsi, 20
        imul rsi, rdi
        sub rdi, 1000
        mov rax, rdi
        mov rdi, 100
        idiv rdi
        add rax, rsi            
        ret

.le1000:
        mov rax, rdi
        imul rax, 20
        mov edx, 0                      ; In cents, if needed
        ret

global main
main:
        push rbp
        mov rbp, rsp
        sub rsp, 16

        read_str [customer_name]        ; Get customer's name
        read_i64 qword [rbp-8]          ; Get customer's electric usage

        mov rdi, qword [rbp-8]
        call cost
        mov qword [rbp-8], rax 
        mov qword [rbp-16], rdx

        log_str [customer_name]         ; Print customer's name
        log_i64 qword [rbp-8]           ; Print the amount of dollars 
        log_i64 qword [rbp-16]          ; Print the amount of cents

        leave
        mov rax, 60
        mov rdi, 0
        syscall
