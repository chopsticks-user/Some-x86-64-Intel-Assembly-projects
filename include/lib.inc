%ifndef ASM_INTEL_X86_LIB_INC
%define ASM_INTEL_X86_LIB_INC

section .data
section .bss
section .text

%macro exit_32 1
        xor eax, eax
        mov edi, %1
        syscall
%endmacro

%macro exit_64 1
        xor eax, eax
        mov rdi, %1
        syscall
%endmacro

%macro if_e_64 3
        cmp %1, %2
        je %3
%endmacro

%macro if_ne_64 3
        cmp %1, %2
        jne %3
%endmacro

%macro if_g_64 3
        cmp %1, %2
        jg %3
%endmacro

%macro if_ge_64 3
        cmp %1, %2
        jge %3
%endmacro

%macro if_l_64 3
        cmp %1, %2
        jl %3
%endmacro

%macro if_le_64 3
        cmp %1, %2
        jle %3
%endmacro

%endif