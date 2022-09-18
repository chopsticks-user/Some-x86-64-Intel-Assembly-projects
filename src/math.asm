; Math utility macro functions
%ifndef MATH_ASM
        %define MATH_ASM

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
        mov ebx, %2
        cdq
        idiv ebx
%endmacro
%macro div_64 2
        mov rax, %1
        mov rbx, %2
        cdq
        idiv rbx
%endmacro

; %1 mod %2
%macro mod_32 2
        mov eax, %1
        mov ebx, %2
        cdq
        idiv ebx
        mov eax, edx
%endmacro
%macro mod_64 2
        mov rax, %1
        mov rbx, %2
        cdq
        idiv rbx
        mov rax, rdx
%endmacro

%endif