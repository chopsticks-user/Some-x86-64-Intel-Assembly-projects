; ; x86_64 Intel Assembly

; ; %include "include/math.inc"
; ; %include "include/debug.inc"
; ; %include "include/lib.inc"

; section .data
;         dec_fm: db "%d", 0x0a
; section .bss
; section .text
;         extern printf
;         extern scanf

; global make_array
; make_array:
;         push rbp
;         mov rbp, rsp
;         mov dword [rbp-4], 0
;         jmp .l1
; .l2:
;         mov eax, dword [rbp-4]
;         mov dword [rbp-24+rax*4], 11
;         add dword [rbp-4], 1
; .l1:
;         cmp dword [rbp-4], 5
;         jl .l2
;         mov eax, dword [rbp-24]
;         pop rbp
;         ret

; global main
; main:
;         push rbp
;         mov rbp, rsp

; ;         mov dword [rbp-4], 0
; ;         jmp .l1
; ; .l2:
; ;         mov eax, dword [rbp-4]
; ;         mov dword [rbp-24+rax*4], 11
; ;         add dword [rbp-4], 1
; ; .l1:
; ;         cmp dword [rbp-4], 5
; ;         jl .l2

;         mov edi, dword [rbp-24]
;         call make_array

;         ; lea eax, dword [rbp-24]

;         lea edi, [dec_fm]
;         mov esi, eax
;         call printf

;         pop rbp
;         mov rax, 60
;         xor rdi, rdi
;         syscall
