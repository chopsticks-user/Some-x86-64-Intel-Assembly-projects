; x86_64 Intel Assembly

%include "include/debug.inc"

section .data
        dec_fm: db "%d", 0x0a
section .bss
section .text
        extern printf

global main
main:
        push rbp
        mov rbp, rsp
        sub rsp, 300

        ; Array 1
        mov eax, -17                    ; fill value
        mov ecx, 25                     ; array size
        lea rdi, dword [rbp-100]        ; buffer
        rep movsd

        ; Array 2
        mov eax, 45                     ; fill value
        mov ecx, 25                     ; array size
        lea rdi, dword [rbp-200]        ; buffer
        rep movsd

        mov ecx, 0
        xor rdx, rdx

;         jmp .l_cond
; .l_exec:
;         lea rax, [rbp+4*rcx-100]
;         lea rbx, [rbp+4*rcx-200]
;         imul rax, rbx
;         add rdx, rax
;         add ecx, 1

; .l_cond:
;         cmp ecx, 25
;         jl .l_exec

;         deb_64 rdx

        add rsp, 300
        pop rbp
        mov rax, 60
        xor rdi, rdi
        syscall