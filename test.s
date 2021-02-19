.bss
NUMBERS .skip 1000 

.text
formatstr: .asciz ”%d\n”

.global main

_main:
        pushq %rbp
        movq %rsp, %rbp
        movq $0, %rbx

loo1:
        movb $1, NUMBERS(%rbx)
        incq %rbx
        cmpq $1000, %rbx
        jl loop1

loop2:
        movq -8 (%rbp), %rbx
        cmpq $1, NUMBERS(%rbx)
        jne lp2end
        movq $formatstr, %rdi
        movq %rbx, %rsi
        movq $0, %rax
        call printf
        movq -8(%rbp), %rbx
        shlq $1, %rbx

loop3:
        cmpq $1000, %rbx
        jge lp2end
        movb $0, NUMBERS(%rbx)
        addq -8(%rbp), %rbx
        jmp loop3

lp2end:
        movq -8(%rbp), %rbx
        incq %rbx
        movq %rbx, -8(%rbp)
        cmpq $1000, %rbx
        jl loop2

end:
        mov $0, %rdi
        call _exit