
; task1.S - avr-gcc assembly code

#include "config.inc"

; buzzer task
;
;   hook the buzzer to PB4 and PB5 for this task

            .extern     led_on
            .global     Task1
            .global     Task1_init

.equ        TASK1_MAX,  1               ; service every interrupt

            .section    .data
Task1counter:
            .byte       0

            .section    .text

; Task 1 - piezo buzzer at 4000Hz
;   uses r16, r17
;
Task1_init:
            sbi     BUZZ_DIR, BUZZ_PIN1     ; set to output
            cbi     BUZZ_PORT, BUZZ_PIN1    ; start this one with 0 
            ret

Task1:
            lds     r16, Task1counter
            inc     r16
            sts     Task1counter, r16
            ;
            ldi     r17, TASK1_MAX
            cpse    r16, r17
            rjmp    1f
            ;
            lds     r16, led_on             ; see if the LED is on
            cpi     r16, 1                  ; test it
            brne    2f                      ; not on - no buzz
            ;
            in      r16, BUZZ_PORT
            ldi     r17, (1<<BUZZ_PIN1)
            eor     r16, r17
            out     BUZZ_PORT, r16  
            ;
2:
            sts     Task1counter, r1        ; zero the counter
1:                    
            ret
