%ifndef ASM_INTEL_X86_LIB_CONSOLE_INC
%define ASM_INTEL_X86_LIB_CONSOLE_INC

section .data
        str_fmt_p: db "%s", 10, 0
        str_fmt_s: db "%s", 0
        dec_fmt_p: db "%ld", 10, 0
        dec_fmt_s: db "%ld", 0
section .bss
section .text

%macro log_i64 1
        lea rdi, [dec_fmt_p]
        mov rsi, %1
        xor eax, eax
        call printf
%endmacro

%macro read_i64 1
        lea rdi, [dec_fmt_s]
        lea rsi, %1
        xor eax, eax
        call scanf
%endmacro

%macro log_str64 1
        lea rdi, [str_fmt_p]
        lea rsi, %1
        xor rax, rax
        call scanf
%endmacro

%macro read_str64 1
        lea rdi, [str_fmt_s]
        lea rsi, %1
        xor rax, rax
        call scanf
%endmacro

%endif



