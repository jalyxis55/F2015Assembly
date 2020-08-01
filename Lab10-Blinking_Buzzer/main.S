
; main.S - avr-gcc assembly language

#include "config.inc"

        .extern Timer1Setup
        .extern trigger

        .extern Task1
        .extern Task2
        .extern Task3
        .extern Task1_init
        .extern Task2_init
        .extern Task3_init

        .section    .text
        .global main

main: 
        ; set up the system clock
        ldi     r24, 0x80               ; set up prescaler
        sts     CLKPR, r24
        sts     CLKPR, r1               ; set to full speed

        ; initialize the system
        call    Timer1Setup
        call    Task1_init
        call    Task2_init
        call    Task3_init
       
        ; task management loop 
1:      
        lds     r16, trigger
        cpi     r16, 1                  ; gone off yet?
        brne    1b                      ; wait for it
        call    Task1
        call    Task2
        call    Task3
        sts     trigger, r1             ; turn off the trigger
        rjmp    1b

