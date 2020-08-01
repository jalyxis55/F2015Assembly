bits    64
global  main
extern  printf

SECTION .data
    ;i       dq  0                       ;qword i = 0
    ;j       dq  0                       ;qword j = 0

SECTION .text
sort:
;------ Set Up Stack Frame -----------------------
	push	rbp
	mov	    rbp, rsp

;------ Start Outer Loop i -----------------------
	mov	    r10, rdi                    ;array address
	mov	    r11, rsi                    ;source index: count param
	mov	    r12, 0                      ;set i = 0
	jmp	    checkOuter

;----- Start Inner Loop j -------------------------
startInner:
	mov	    r13, 0                      ;set j = 0
	jmp	    checkInner

shuffle:
	mov	    rax, r13                    ;load j into eax
	cdqe                                ;convert dd to dq
	lea	    rdx, [0+rax*4]              ;moving down array? 4bytes?
	mov	    rax, r10                    ;array address into rax
	add	    rax, rdx                    ;move down array
	mov	    edx, DWORD  [rax]           ;tgt1: array elem [j] to edx

	mov	    rax, r13                    ;mov j into eax (again)
	cdqe                                ;convert dd to dq
	inc	    rax                         ;next eleemnt in array
	lea	    rcx, [0+rax*4]              ;moving to compare element
	mov	    rax, r10                    ;array address into rax
	add	    rax, rcx                    ;address of [j]
	mov	    eax, DWORD  [rax]           ;element [j] into eax
	cmp	    edx, eax                    ;compare [i] and [j]
	jle	    incJ                        ;increment j if less

    ;array[j]
	mov	    rax, r13                    ;j address into eax
	cdqe                                ;convert dd to dq
	lea 	rdx, [0+rax*4]              ;get next address in array
	mov 	rax, r10                    ;load array address
	add	    rax, rdx                    ;move to next
	mov	    eax, DWORD  [rax]           ;[j] into rdx
	mov	    DWORD  [rbp-4], eax         ;if j = rbp-8, this is j+1??
	mov	    rax, r13                    ;j into eax again??
	cdqe                                ;convert dd to dq

	lea	    rdx, [0+rax*4]              ;get next address
	mov	    rax, r10                    ;array address to rax
	add	    rdx, rax                    ;move to next
	mov	    rax, r13                    ;j into eax
	cdqe                                ;convert dd to dq

	inc	    rax                         ;increment next
	lea	    rcx, [0+rax*4]
	mov	    rax, r10                    ;array address
	add	    rax, rcx                    ;j address
	mov	    eax, DWORD  [rax]           ;elemnt [j] to eax
	mov	    DWORD  [rdx], eax           ;element [i]
	mov	    rax, r13                    ;i :: j
	cdqe                                ;convert dd to dq

    ;array[j+1]
	inc	    rax                         ;increment next
	lea	    rdx, [0+rax*4]              ;next address
	mov	    rax, r10                    ;array address
	add 	rdx, rax                    ;move over
	mov	    eax, DWORD  [rbp-4]         ;[j+1] to eax
	mov	    DWORD  [rdx], eax

;-- Increment Inner J --------------------------
incJ:
	inc	    r13                             ;j++

;-- Check Inner Loop and decrement j ----------
checkInner:
	mov 	rax, r11                        ;put count into eax
	dec	    eax                             ;count--
	sub	    rax, r12                        ;(count - i)
	cmp	    rax, r13                        ;count :: j
	  jg	    shuffle                         ;j > count = shuffle
    inc	    r12                             ;else i++

;-- Check Outer Loop and decrement count ----------
checkOuter:
	mov	    rax, r11                    ;move count to eax
	dec	    eax                         ;count--
	cmp	    rax, r12                    ;compare count :: i
	  jg	    startInner                  ;i < count = inner loop
	pop	    rbp                         ;else done: pop base ptr
ret
