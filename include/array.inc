%ifndef ASM_INTEL_X86_LIB_ARRAY_INC
%define ASM_INTEL_X86_LIB_ARRAY_INC

section .data
section .bss
section .text

; %1: buffer, %2: array size, %3: fill value
%macro array_fill 3 
        lea rdi, %1
        mov ecx, %2
        mov eax, %3
        rep stosd
%endmacro

; %1: source buffer, %2: destination buffer,
; %3: numbers of elements being copied
%macro array_copy 3
        lea rsi, %1
        lea rdi, %2
        mov rcx, %3
        rep movsd
%endmacro

%endif