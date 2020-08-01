bits    64
global  main
extern	printf
extern  scanf

SECTION .data
    msg     db  "Enter a positive whole number: ", 10, 0
    readNum db  "%d",0
    confirm db  "You chose: %d", 10, 0
    fibStr  db	"Fib num: %d", 10, 0	    ;fib value printed out
    input   db  10                          ;prefill n=10

SECTION .text
main:
    push    rbp             ;function setup: create stack frame
    mov     rbp, rsp
    sub     rsp, 16 

;ask for user input
    xor     rax, rax
    mov     rdi, msg        ;msg into rdi to be read
    call    printf          ;printing rdi contents

;take in user input
    xor     rax, rax
    mov     rdi, readNum    ;address of readNum into dest index
    mov     rsi, input      ;index to src index
    call    scanf           ;does  top of stack?

;print back user input to confirm
    xor     rax, rax
    mov     rdi, confirm    ;printing format
    mov     rsi, [input]    ;input data into src index
    call    printf

    ;call    loop_n          ;loop n times
;recursive call
    mov     rbp, input      ;n into accessible register
    call    refib           ;recursive version

;print final fibonacci number
    xor     rax, rax
    mov     rdi, fibStr     ;load   final fib
    call    printf

;function return
    mov     eax, 0          ;exit code: 0 (success)
    add     rsp, 32
    mov	eax, 1		        ;system call: sys_exit
	int	0x80		        ;call kernel
ret

;--------------------------------------------------------
;------------- Start Recursion ---------------------------
;---------------------------------------------------------

;------------ Preserve and return n --------------
end:
    mov     rsp, rbp
    pop     rbx
    pop     rbp
ret

;------------ f(0) = 0 ---------------------------
fib0:
    cmp		rbx, 0		    ;does n = 0?
    jne		fib1		    ;if n != 0: go to fib1
    mov     rax, 0          ;else n=0 and f(0) = 0
    jmp     end             ;preserve and return n=0

;------------ f(1) = 1 -----------------------
fib1:
    cmp		rbx, 1		    ;if n != 1 AND != 0
    jne		fibn	        ;recursive case found, jump fibn
    mov     rax, 1          ;else n=1 and f(1) = 1
    jmp     end             ;preserve and return n=1


;------ Recursive: f(n) = f(n-1) + f(n-2) -----
refib:
    push    rbp             ;push n to stack
    mov     rbp, rsp    	;set stack pointer to n
    push    rbx             ;push rbx to stack: 2nd term
   ; mov     rbx, [input]    ;move n from stack into rbx

    call    fib0            ;first base case check: f(0) = 0
    call    fib1            ;second base case check: f(1) = 1

    ;recursive case: n > 1: f(n) = 1st + 2nd
fibn:
    mov     r11, rbx        ;need to alter n, put in temp
    sub		r11, 1		    ;temp = (n-1), setup 1st term
    mov     rbx, r11        ;set new: n = (n-1)
    push    rbx             ;(n-1) to stack
    ;mov     rdi, rbx        ;put (n-1) into dest index
    call	refib	    	;call f(n-1)

    mov		r12, [input]	;need to alter n, put in temp
    sub		r12, 2		    ;rbx = (n-2), setup 2nd term
    mov     rdi, r12        ;put (n-2) into dest index
    call	refib		    ;call f(n-2)

    add		r11, r12		;f(n) = f(n-1) + f(n-2)
    mov     rbx, r11        ;put n into rbx
    jmp		end


;--------------------------------------------------------
;------- Loop n times : Recurse Later -------------------
;--------------------------------------------------------
loop_n:
	push	rcx		        ;store rcx
	mov	    rcx, 0		    ;set rcx counter to 0

    for_loop:
	    call	refib		;call refib by pointer
	    inc	    rcx		    ;increment counter
	    cmp	    rcx, [input];compare counter to n
	    jne	    for_loop	;loop if count != n
	    pop	rcx		        ;restore rcx
ret		    	            ;finished for_n loop

;get f(n) and print, step over
refib:				        ;begin fib stepping
	push	r14		        ;store r14 for f(n) printing
	push	r15		        ;store r15 for string printing
	push	rax		        ;store rax for temp

	mov	    r14, r10	    ;copy r10 first val for print
	mov	    r15, fibStr	    ;copy string addy to r15 for print
	call	print   	    ;print fib str, r10 as param

    ;assign new f(n) and f(n+1)
	mov	    rax, r10	    ;first goes into temp, prep to step
	mov	    r10, r11	    ;f(n) = f(n+1), take a step
	add	    r11, rax	    ;new r11 f(n+1) = tmp + old f(n+1)

    ;clean up stack in reverse
	pop	    rax
	pop	    r15
	pop	    r14
ret

;print to see what we're doing
print:
    ;store all registers (safety concern)
	push	rax             ;temp storage
	push	rcx             ;counter
	push	rsi
	push	rdi
	push	rbp
	push	rsp
	push	r10             ;first value, f(n)
	push	r11             ;second value, f(n+1)
	push	r12

	mov	    rsi, r14	    ;first val stored in r14, f(n)
	mov	    rdi, r15	    ;string stored in r15
	mov 	eax, 0		    ;no non-int args
	call	printf		    ;call printf

    ;clean up stored registers in reverse
	pop	    r12
	pop	    r11
	pop	    r10
	pop 	rsp
	pop 	rbp
	pop	    rdi
	pop	    rsi
	pop	    rcx
	pop	    rax
ret



