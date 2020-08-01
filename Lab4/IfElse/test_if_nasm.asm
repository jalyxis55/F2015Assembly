;basic NASM assembly language program

	bits	64
	global	main
	extern	puts

	section	.data
A	dd	3
B	dd	7
LC0	db	"TRUE", 10, 0
LC1	db	"FALSE", 10, 0

	section	.text
main:
	;function setup
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	;user code goes here
	mov	dword [rbp-4], edi
	mov	qword [rbp-16], rsi
	mov	edx, dword [A]
	mov	eax, dword [B]
	cmp	edx, eax	;compare step to determine which string to print
	jle	L2		;Jump to 'L2' if B <= A
	mov	edi, LC0	;point to the message
	call	puts		;call puts to print LC0 if A > B
	jmp	L4

L2:
	mov	edi, LC1	;point to the False message
	call	puts		;call puts to print LC1

L4:
	;function return
	mov	eax, 0
	add	rsp, 16
	pop	rbp
	ret
