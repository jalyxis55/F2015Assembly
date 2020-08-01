; For Mac OS-X maintain 16 byte alignment on all calls

	bits 64
	global  main
	extern  printf

	section .text
main:
	; function setup
	push    rbp
	mov     rbp, rsp
	sub     rsp, 32
        ;print the message
        lea     rdi, [rel message]
        mov     al, 0
        call    printf

	mov	rax, 12345
	mov	rdi, rax
	mov	al, 0
	call	printf

	mov	rbx, rax
	inc	rbx		;++
	inc	rbx		;++
	mov	rax, rbx
	mov	rdi, rax
	mov	al, 0
	call	printf

        ; function return
        mov     eax, 0
        add     rsp, 32
        pop     rbp
        ret

        section .data
message db	"Lab4- Modified hello program\nCOSC2325 - Pentium assembly language\nProcessed with NASM and GNU gcc", 10, 0

