;basic NASM assembly language program

	bits	64
	global	main
	extern	puts

	section	.data
A	dd	0
B	dd	5
LC0	db	"COUNTING", 10, 0

	section	.text
main:
	;function setup
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	;user code goes here
	mov	dword [rbp-4], edi
	mov	qword [rbp-16], rsi
	jmp	L2

L3:
	mov	edi, LC0
	call	puts
	mov	eax, dword [A]
	add	eax, 1
	mov	dword [A], eax

L2:
	mov	edx, dword [A]
	mov	eax, dword [B]
	cmp	edx, eax
	jl	L3

	;function return
	mov	eax, 0
	add	rsp, 16
	pop	rbp
	ret
