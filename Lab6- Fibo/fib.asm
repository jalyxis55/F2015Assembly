bits    64
global  main
extern	printf
extern  scanf

SECTION .data
    msg     db  "Enter a positive whole number: ", 10, 0
    readNum db  "%d",0
    confirm db  "You chose: %d", 10, 0
    fibStr  db	"Fib num: %d", 10, 0	    ;fib value printed out
    input   dq  0                          ;prefill n=10

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
    mov     rsi, qword input;index to src index
    call    scanf           ;does  top of stack?

;print back user input to confirm- use stack to test
    ;xor     rax, rax        ;remove chatter
    mov     rdi, confirm    ;printing format
    mov     rsi, [input]    ;input data into src index
    call    printf
    pop rbp

;recursive call
    push    input           ;push input n to stack
    call    refib           ;recursive version, returns n

    push    rbp
    ;mov     rbp, rsp
    ;add     rbx, 24
    ;mov     rbx, [rbp]   ;mov n to rbx, last param pushed??
    push     rbx

;print final fibonacci number
    ;add     rsp, 8          ;last element in stack
   ; mov     rbx, rsp
    xor     rax, rax        ;remove chatter
    ;xor     eax, eax       ;remoe chatter
    mov     rdi, fibStr     ;load final text
    mov     rsi, [rbx]        ;put final n into rsi
    call    printf

    pop     rbx
    pop     rbp

;function return
    mov     edi, 0
    mov     eax, 60
    syscall
    mov     eax, 0          ;exit code: 0 (success)
    add     rsp, 32
    mov	    eax, 1		        ;system call: sys_exit
	int	    0x80		        ;call kernel
ret

;--------------------------------------------------------
;------------- Start Recursion ---------------------------
;---------------------------------------------------------

;------ Recursive: f(n) = f(n-1) + f(n-2) -----
refib:
    push    rbp             ;set base pointer to stack
    push    rbx             ;save prev n

    mov     rbp, rsp        ;set stack pointer
    sub     rsp, 24         ;mov n to rbx, last param pushed
    mov     rbx, [rsp]      ;mov n into temp to compare

    ;xor     rbx, rbx
    ;mov     r11, rbx
    ;mov     rsi, [r11]
    ;mov     rdi, confirm
    ;call    printf

    cmp     rbx, 1          ;if n :: 1
    jle     fibbase         ;n <= 1: go to base case

    lea     rcx, [rbx-1]    ;f(n-1), try as counter
    push    rcx
    call    refib

    push    rax             ;different register- STOP OVERWRITE!!
    lea     rcx, [rbx-2]    ;f(n-2)
    push    rcx
    call    refib
;-------------- sum and return ------------------------------
    pop     rax
    pop     rcx
    add     rax, rcx        ;f(n) = f(n-2) + f(n-1) to RAX!!!
    xor     rax, rax        ;clear chatter
    jmp     end
    ;pop     rbp             ;else return n to stack
    ;ret                     ;return n

    ;recursive case: n > 1: f(n) = 1st + 2nd
;fibn:
    ;sub		rbx, 1		    ;n = (n-1), setup 1st term
    ;push    rbx             ;(n-1) to stack
    ;call	refib	    	;call f(n-1)

    ;mov		r12, [input]	;need to alter n, put in temp
    ;sub		r12, 2		    ;rbx = (n-2), setup 2nd term
    ;push    r12             ;put (n-2) onto stack
    ;call	refib		    ;call f(n-2)

   ; pop     r12             ;f(n-2)
    ;pop     r11             ;f(n-1)
    ;add		r11, r12		;f(n) = f(n-1) + f(n-2)
    ;mov     rbx, r11        ;put n into rbx
    ;push    rbx
    ;ret

;------------------ moved to end to clean visual clutter ---------
fibbase:
   ; mov     rbx, 1          ;f(n<=1) = 1
end:
    pop     rbx
    pop     rbp
ret
