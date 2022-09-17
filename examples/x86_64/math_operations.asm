; x86_64 Intel Assembly

%macro define_normal_func_stack 0
        push rbp
        mov rbp, rsp
%endmacro

%macro clean_normal_func_stack 0
        pop rbp
        ret
%endmacro

section .data
section .bss
section .text
        global _start
        global _x86_64_as_add_2_nums
        global _x86_64_as_sub_2_nums
        global _x86_64_as_mul_2_nums
        global _x86_64_as_div_2_nums

_x86_64_as_add_2_nums:
        add eax, edi
        ret

_x86_64_as_sub_2_nums:
        sub eax, edi
        ret

_x86_64_as_mul_2_nums:
        push rbp
        mov rbp, rsp

        mov dword [rbp-4], edi
        mov dword [rbp-8], esi
        mov eax, dword [rbp-4]
        imul eax, dword [rbp-8]

        pop rbp
        ret

_x86_64_as_div_2_nums:
        push rbp
        mov rbp, rsp

        mov dword [rbp-4], edi
        mov dword [rbp-8], esi
        mov eax, dword [rbp-4]
        cdq
        idiv dword [rbp-8]

        pop rbp
        ret

_x86_64_as_mod_2_nums:
        push rbp
        mov rbp, rsp

        mov dword [rbp-4], edi
        mov dword [rbp-8], esi
        mov eax, dword [rbp-4]
        cdq
        idiv dword [rbp-8]
        mov eax, edx

        pop rbp
        ret

_start:
        mov edi, 72
        mov esi, 65
        call _x86_64_as_mod_2_nums

        mov eax, 60
        xor edi, edi
        syscall