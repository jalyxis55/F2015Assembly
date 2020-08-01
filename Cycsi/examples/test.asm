; test.asm - Cycsi test program

        MOV     r1, 15
        mov     r2, 0
l1:     out     r2
        add     r1, 1
        cmp     r2, 20
        jne     l1
        hlt
