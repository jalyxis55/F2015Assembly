; hello.asm - basic NASM assembly language program
    bits 64
    global  main
    extern  puts

    section .data
A       dd      3
B       dd      7
LC0     db      "TRUE", 10, 0
LC1     db      "FALSE", 10, 0

    section .text
main:
    ; funtion setup
    push	rbp
    mov		rbp, rsp
    sub		rsp, 32

	; user code goes here
	mov		[rbp-4], edi
	mov		[rbp-16], rsi
	mov		DWORD [A], 0
	jmp		L2

L3:
	mov		edi, LC0
	call	puts
	mov		eax, [A]
	add		eax, 1
	mov		DWORD [A], eax

L2:
	mov		eax, [A]
	cmp		eax, 2
	jle		L3
	leave
	ret

L4:
    ; function return
    mov     eax, 0
    add     rsp, 32
    pop     rbp
    ret

