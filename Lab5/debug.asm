;Group Echo - Lab 5 Debugger

	bits	64
	global	main
	extern	printf
	
	section	.data
message	db	"Lab 5 - Modified Hello Program", 10, "COSC2325 - Pentium Assembly Language",
			10, "Processed with NASM and GNU gcc", 10, 0
			
	section	.text
main: 
	;function setup
	push	rbp
	mov		rbp, rsp
	sub		rsp, 32
	
	;print message
	mov		rdi, message
	call	printf
	
	mov		rax, 12345
	mov		rdi, rax
	call	printf
	
	mov		rbx, rax
	inc		rbx
	inc		rbx
	
	mov		rax, rbx
	
	mov		rdi, rax
	call	printf
	
	;function return
	mov		eax, 0
	add		rsp, 32
	pop		rbp
	ret