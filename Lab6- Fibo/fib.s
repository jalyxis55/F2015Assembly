	.file	"fib.c"
	.intel_syntax noprefix
	.section	.rodata
	.align 8
.LC0:
	.string	"Enter a positive number of terms to calculate"
.LC1:
	.string	"%d"
.LC2:
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	DWORD PTR [rbp-8], 0
	mov	DWORD PTR [rbp-4], 0
	mov	edi, OFFSET FLAT:.LC0
	call	puts
	lea	rax, [rbp-12]
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC1
	mov	eax, 0
	call	__isoc99_scanf
	mov	DWORD PTR [rbp-8], 1
	jmp	.L2
.L3:
	mov	eax, DWORD PTR [rbp-4]
	mov	edi, eax
	call	refib
	mov	esi, eax
	mov	edi, OFFSET FLAT:.LC2
	mov	eax, 0
	call	printf
	add	DWORD PTR [rbp-4], 1
	add	DWORD PTR [rbp-8], 1
.L2:
	mov	eax, DWORD PTR [rbp-12]
	cmp	DWORD PTR [rbp-8], eax
	jle	.L3
	mov	edi, 10
	call	putchar
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	refib
	.type	refib, @function
refib:
.LFB1:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 24
	.cfi_offset 3, -24
	mov	DWORD PTR [rbp-20], edi
	cmp	DWORD PTR [rbp-20], 0
	jne	.L6
	mov	eax, 0
	jmp	.L7
.L6:
	cmp	DWORD PTR [rbp-20], 1
	jne	.L8
	mov	eax, 1
	jmp	.L7
.L8:
	mov	eax, DWORD PTR [rbp-20]
	sub	eax, 1
	mov	edi, eax
	call	refib
	mov	ebx, eax
	mov	eax, DWORD PTR [rbp-20]
	sub	eax, 2
	mov	edi, eax
	call	refib
	add	eax, ebx
.L7:
	add	rsp, 24
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	refib, .-refib
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
