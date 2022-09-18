; Math utility macro functions

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

; Devide %1 by %2 and return the result to 
; either the register <eax> or <rax>
%macro div_32 2
        mov eax, %1
        cdq
        idiv %2
%endmacro
%macro div_64 2
        mov rax, %1
        cdq
        idiv %2
%endmacro

; Devide %1 by %2 and return the result to 
; either the register <eax> or <rax>
%macro mod_32 2
        mov eax, %1
        cdq
        idiv %2
        mov eax, edx
%endmacro
%macro mod_64 2
        mov rax, %1
        cdq
        idiv %2
        mov rax, rdx
%endmacro