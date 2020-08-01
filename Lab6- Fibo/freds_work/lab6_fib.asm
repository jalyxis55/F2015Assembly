; fib.asm - basic NASM assembly language program demonstrating fibonacci recursion

    bits 64
    global  main
    extern  printf
    extern scanf

    ; Message to be printed
    section .data
message db      "Enter a positive number of terms to calculate", 10, 0

    ; variable to hold integer
input   db  0   ; declare input variable holding 0 in it

    section .text
main:
    ; funtion setup
    push	rbp
    mov		rbp, rsp
    sub		rsp, 32

    ; Print message
    lea     rdi, [rel message]
    mov     al, 0
    call    printf

    ; Read user input and store in input variable
    mov     eax, 3
    mov     ebx, 1
    mov     ecx, input
    mov     edx, 8
    int     0x80

    ; Output the user's number
    lea     rdi, [rel input]
    mov     al, 0
    call    printf

    ; user code goes here

    ; function return
    mov     eax, 0
    add     rsp, 32
    pop     rbp
    ret

    ;note: f(0) = 0
fib0:
    mov     rax, 0

    ;note: f(1) = 1
fib1:
    mov     rax, 1

    ;note: f(n) = f(n-1) + f(n-2)
fibrec:
    push    rbp         ;push base pointer to stack
    mov     rbp, rsp    ;move stack pointer to rbp


