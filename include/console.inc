%ifndef ASM_INTEL_X86_LIB_CONSOLE_INC
%define ASM_INTEL_X86_LIB_CONSOLE_INC

section .data
section .bss
section .text

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

%endif

