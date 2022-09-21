; x86_64 Intel Assembly

section .data
        dec_fm: db "%d", 0x0a
section .bss
section .text
        extern printf

global fibonacci
fibonacci:
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

global main
main:
        push rbp
        mov rbp, rsp

        mov rdi, 500
        call fibonacci

        lea rdi, [dec_fm]
        mov rsi, rax
        call printf

        pop rbp
        mov rax, 60
        xor rdi, rdi
        syscall