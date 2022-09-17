global _start
section .data
        msg:
section .bss
section .text
_sq:
        push rbp
        mov rbp, rsp

        imul eax, eax

        pop rbp
        ret

_print:
        push rbp
        mov rbp, rsp

        mov dword [rbp-4], edi
        mov eax, 1
        mov edi, 1
        mov esi, dword [rbp-4]
        mov edx, 10
        syscall

        pop rbp
        ret

_start:
        push rbp
        mov rbp, rsp

        mov eax, 40
        call _sq
        mov edi, eax
        ; call _print

        pop rbp
        mov eax, 60
        ; xor edi, edi
        syscall