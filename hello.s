# Assignment_1 Group 20

.global _main # subroutine main 

main:
    movq %rsp, %rbp
    mystring: .asciz "Daphne_Xiaoxuan_2644582_2661045_Assignment_1\n" # string with names, student number and assignment

    movq $0, %rax # no vector registers in use for printf
    movq $mystring, %rdi  # load address of a string
    call printf # Call the printf routine

end:
    movq $0, %rdi
    call exit