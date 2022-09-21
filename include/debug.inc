; Debugging utility macro functions
%ifndef ASM_INTEL_X86_LIB_DEBUG_INC
%define ASM_INTEL_X86_LIB_DEBUG_INC

section .data
        hex_codes: db "0123456789ABCDEF"
        newline_char: db 10
section .bss
section .text
        global _deb_64_endline
        global _deb_64_hex

_deb_32_endline:
    mov eax, 1
    mov edi, 1
    mov esi, newline_char
    mov edx, 1
    syscall
    ret

_deb_64_endline:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline_char
    mov rdx, 1
    syscall
    ret

; _deb_32_hex:
;         mov eax, edi
;         mov edi, 1
;         mov edx, 1
;         mov ecx, 64     
; .iterate:
;         push eax
;         sub ecx, 4
;         sar eax, cl
;         and eax, 0xf
;         lea esi, [hex_codes + eax]
;         mov eax, 1
;         push ecx
;         syscall
;         pop ecx
;         pop eax
;         test ecx, ecx
;         jnz .iterate
;         ret

_deb_64_hex:
        mov rax, rdi
        mov rdi, 1
        mov rdx, 1
        mov rcx, 64     
.iterate:
        push rax
        sub rcx, 4
        sar rax, cl
        and rax, 0xf
        lea rsi, [hex_codes + rax]
        mov rax, 1
        push rcx
        syscall
        pop rcx
        pop rax
        test rcx, rcx
        jnz .iterate
        ret

%macro deb_32 1
        mov edi, %1
        call _deb_32_hex
        call _deb_32_endline
%endmacro
%macro deb_64 1
        mov rdi, %1
        call _deb_64_hex
        call _deb_64_endline
%endmacro
%macro deb_32_el 0
        call _deb_32_endline
%endmacro
%macro deb_64_el 0
        call _deb_64_endline
%endmacro

%endif
