; Compute the length of a string given by the user's input
section .data
        str: dq "", 0
section .bss
section .text
        global _start
        global _str_len
        global _get_input

_str_len:
        xor rax, rax

.loop:
        cmp byte [rdi+rax], 0
        je .end
        inc rax
        jmp .loop

.end:
        dec rax
        ret

_get_input:
        mov rax, 0
        mov rdi, 0
        mov rsi, str
        mov rdx, 16
        syscall
        ret

_start:
        call _get_input

        ; mov rdi, str
        ; call _str_len

        sub rax, 1      ; Alternatively, since <rax> holds the length,
        mov rdi, rax    ; including the '\0' character, input string.
        
        mov rax, 60
        syscall