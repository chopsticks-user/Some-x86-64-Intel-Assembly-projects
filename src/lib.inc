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

%endif