; x86_64 Intel Assembly
%include "src/math.inc"
%include "src/debug.inc"
%include "src/lib.inc"

section .data
section .bss
section .text
        global _start

_start:
        mul_64 2, 7

        exit_64 0
