; x86_64 Intel Assembly

; %include "include/math.inc"
; %include "include/debug.inc"
; %include "include/lib.inc"

section .data
        dec_fm: db "%d", 0x0a
section .bss
section .text
        extern printf
        extern scanf

global make_array_db
make_array_db:  ; rdi: address, rsi: length, rdx: fill value
        push rbp
        mov rbp, rsp

        jmp .cnd
.lp:    
        sub esi, 1
        mov dword [rdi+4*rsi], esi
.cnd:
        test esi, esi
        jnz .lp

        pop rbp
        ret

global main
main:
        push rbp
        mov rbp, rsp

        lea rdi, dword [rbp-100]
        mov esi, 25
        mov edx, 111
        call make_array_db

;         mov ecx, 25
;         lea rax, dword [rbp-100]
;         jmp .cnd
; .lp:
;         sub ecx, 1
;         mov dword [rax+4*rcx], 72
; .cnd:
;         test ecx, ecx
;         jnz .lp

        lea rax, dword [rbp-4]
        lea rdi, [dec_fm]
        mov rsi, rax
        call printf

        pop rbp
        mov rax, 60
        mov rdi, rsi
        syscall
