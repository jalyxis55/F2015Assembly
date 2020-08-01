;Group Project 2
;Group Echo - Jennifer Shelby, Gina Hall, Freddy Esteban
;Date: December 1, 2015

;.equ    PIND, 0x09                  ; the input PIND register
.equ    DELAY, 200                  ; delay constant

#include "config.inc"

    	.section	.text
    	.org		0x00
        .global     main

main:
	;set up the stack
	ldi		r28, (RAMEND & 0X00ff)
	ldi		r29, (RAMEND >> 8)
	out		_SPH, r29
	out		_SPL, r28

	;initialize the chip
	call	init

    ; call the main loop
    call    main_loop

    ret

main_loop:
    call    Trigger_OFF              ; send LOW to TRIG_PIN
    call    System_Delay

    call    Trigger_ON              ; send HIGH to TRIG_PIN
    call    System_Delay

    call    Trigger_OFF              ; send LOW to TRIG_PIN
    call    System_Delay

    ; trig pin set to HIGH

    call System_Delay
    rjmp    main_loop               ; repeat the loop
    ret

init:
	eor		r1, r1		            ;zero out the r1 register
	out		_SREG, r1	            ;initializes the status register

    ; set up the LED port
    sbi     RED_LED_DIR, RED_LED_PIN      ; set pin 11 on port b for output
    cbi     RED_LED_PORT, RED_LED_PIN       ; start with the LED off

    ; set up the LED port
    sbi     GREEN_LED_DIR, GREEN_LED_PIN      ; set pin 10 on port c for output
    cbi     GREEN_LED_PORT, GREEN_LED_PIN   ; start with the LED off

    ; initialize trigger
    sbi     TRIG_DIR, ECHO_PIN      ; set trigger pin 13 for output
    cbi     TRIG_PORT, ECHO_PIN             ; start with the LED off
    ret

; the delay of 20000 cycles on the 16mhz chip
System_Delay:
    ldi     r17, DELAY              ; outer loop

SD_L1:
    ldi     r18, DELAY              ; inner loop

SD_L2:
    dec     r18
    brne    SD_L2
    dec     r17
    brne    SD_L1
    ret

; trigger routines
Trigger_ON:
    sbi     TRIG_PORT, TRIG_PIN     ; set the trigger bit in PORTD high
    ret

Trigger_OFF:
    cbi     TRIG_PORT, TRIG_PIN     ; set the trigger bit in PORTD low
    ret

Toggle_RED:
    in          r24, RED_LED_PORT          ; get current port B values
    ldi         r25, (1 << RED_LED_PIN)    ; LED pin number
    eor         r24, r25                ; toggle bit
    out         RED_PORT, r24          ; write it back in place
    ret

Toggle_GREEN:
    in          r24, GREEN_LED_PORT          ; get current port B values
    ldi         r25, (1 << GREEN_LED_PIN)    ; LED pin number
    eor         r24, r25                ; toggle bit
    out         GREEN_PORT, r24          ; write it back in place
    ret
