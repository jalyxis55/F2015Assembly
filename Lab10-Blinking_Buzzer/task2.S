
; task2.S - avr-gcc assembly code

#include "config.inc"

; LED task
;
;   This task uses the built-in LED on the Teensy

        .global     Task2_init
        .global     Task2
        .global     led_on

.equ    TASK2_MAX,  4000                ; trigger every 1/2 second


        .section    .data
Task2countH:        .byte       0
Task2countL:        .byte       0
led_on:             .byte       0

        .section    .text

Task2_init:
        sts         Task2countH, r1     ; clear counter
        sts         Task2countL, r1
        ; set up LED port
        sbi         LED_DIR, LED_PIN    ; set up the output port (bit 6)
        cbi         LED_PORT, LED_PIN   ; start off with the LED off
        sts         led_on, r1
        ret

Task2:
        lds         r26, Task2countL        ; load counter
        lds         r27, Task2countH
        adiw        r26, 1                  ; increment counter
        sts         Task2countL, r26        ; save it back
        sts         Task2countH, r27 
        ;
        cpi         r26, TASK2_MAX & 0xff    ; Compare low byte
        ldi         r16, TASK2_MAX >> 8
        cpc         r27, r16                ; Compare high byte
        brne        1f                      ; branch if not equal
        ;
        in          r16, LED_PORT           ; toggle LED pin
        ldi         r17, (1<<LED_PIN)
        eor         r16, r17                ; flip the LED bit
        ;
        sts         led_on, r1              ; say it is off
        sbrs        r16, LED_PIN            ; skip if it is on
        rjmp        2f
        ldi         r17, 1                  ; get a 1
        sts         led_on, r17             ; say it is on
2:
        out         LED_PORT, r16           ; set the LED pin
        sts         Task2countL, r1         ; and clear the counter
        sts         Task2countH, r1
1:
        ret
