; x86_64 Intel Assembly
%include "include/math.inc"
%include "include/debug.inc"
%include "include/lib.inc"

section .data
section .bss
section .text

global _start
_start:
        push rbp
        mov rbp, rsp

        mul_64 2, 55
        abs_64 rax
        deb_64 rax

        pop rbp
        exit_64 rax
