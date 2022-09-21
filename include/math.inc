; Math utility macro functions
%ifndef ASM_INTEL_X86_LIB_MATH_INC
%define ASM_INTEL_X86_LIB_MATH_INC

section .data
section .bss
section .text

; Perform the addition of 2 numbers and return the result to 
; either the register <eax> or <rax>
%macro add_32 2
        mov eax, %1
        add eax, %2
%endmacro
%macro add_64 2
        mov rax, %1
        add rax, %2
%endmacro

; Perform the substraction of 2 numbers and return the result to 
; either the register <eax> or <rax>
%macro sub_32 2
        mov eax, %1
        sub eax, %2
%endmacro
%macro sub_64 2
        mov rax, %1
        sub rax, %2
%endmacro

; Multiply 2 numbers and return the result to 
; either the register <eax> or <rax>
%macro mul_32 2
        mov eax, %1
        imul eax, %2
%endmacro
%macro mul_64 2
        mov rax, %1
        imul rax, %2
%endmacro

; Devide %1 by %2
%macro div_32 2
        mov eax, %1
        mov edi, %2
        cdq
        idiv edi
%endmacro
%macro div_64 2
        mov rax, %1
        mov rdi, %2
        cdq
        idiv rdi
%endmacro

; 20.00$/kwh <=> 2,000 cents/kwh
; charge an extra of 1 cent per kwh
; over 1000

; Find the absolute value of %1
%macro abs_32 1
        mov eax, %1
        mov edx, eax
        neg eax
        cmovl eax, edx
%endmacro
%macro abs_64 1
        mov rax, %1
        mov rbx, rax
        neg rax
        cmovl rax, rbx
%endmacro

global _fibonacci_64
_fibonacci_64:
        cmp rdi, 0              ; if (n <= 0)
        jle .c0
        cmp rdi, 2              ; if (n <= 2)
        jle .c12

        mov rcx, 3              ; i = 3
        mov rax, 2              ; current = 1 (last1)
        mov rdx, 1              ; last1 = 1
        mov rsi, 1              ; last2 = 1
        jmp .cnd                
.lp:
        mov rdx, rax            ; last1 = current
        add rax, rsi            ; current += last2
        mov rsi, rdx            ; last2 = last1
        inc rcx                 ; ++i
        
.cnd
        cmp rcx, rdi
        jne .lp
        ret
.c12
        mov rax, 1
        ret
.c0:
        xor rax, rax
        ret

%macro fib_64 1
        mov rdi, %1
        call _fibonacci_64
%endmacro

global _factorial_64
_factorial_64:
        cmp edi, 1
        jle .case01
        mov eax, 2
        mov ecx, edi
        jmp .loop_cond          ; n >= 2

.loop_exec:
        imul rax, rcx
        dec ecx

.loop_cond:
        cmp ecx, 2
        jg .loop_exec
        ret

.case_neg:
        xor eax, eax            ; return 0 if n < 0
        ret

.case01:
        cmp edi, 0              ; return 1 if n > 0 && n <= 1
        jl .case_neg
        mov eax, 1
        ret

%macro fact 1
        mov rdi, %1
        call _factorial_64
%endmacro

%endif