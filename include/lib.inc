%ifndef LIB_INC
%define LIB_INC

section .data
section .bss
section .text

global _get_string_32
_get_string_32:
        ret

global _get_string_64
_get_string_64:
        ret

global _lib_exit_32
_lib_exit_32:
        mov eax, 60
        syscall

global _lib_exit_64
_lib_exit_64:
        mov rax, 60
        syscall

%macro exit_32 1
        mov edi, %1
        call _lib_exit_32
%endmacro

%macro exit_64 1
        mov rdi, %1
        call _lib_exit_64
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