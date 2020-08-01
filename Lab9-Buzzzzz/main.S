#include <avr/io.h>
#include "config.inc"

    .section    .text
    .org        0x00
    .extern     timer_init
    .extern     timer_delay

    .global     main

main:
; set stack to top of available ram
    ldi         r28, (RAMEND & 0x00ff)
    ldi         r29, (RAMEND >> 8)
    out         _SPH, r29
    out         _SPL, r28
    ;
    call        Init            ; complete initialization
1:  call        Toggle          ; flip BUZZER on/off
    call        timer_delay     ; wait a bit
    rjmp        1b              ; loop forever

Init:
    ; set up a register with zero for convenience
    eor         r1, r1          ; cheap zero
    
    ; clear flag register
    out         _SREG, r1

    ; set up the system clock
    ldi         r24, 0x80       ; set up prescaler
    sts         CLKPR, r24
    ldi         r24, 7
    sts         CLKPR, r24      ; divide by 128 = 125000 Hz

    ; setup the buzzer pin
    sbi         BUZZ_DIR, BUZZ_PIN  ; set pin 5 on port B for output
    cbi         BUZZ_PORT, BUZZ_PIN ; set pin 5 on port B off

    call        timer_init      ; set up the timer
    ret

Toggle:
    in          r24, BUZZ_PORT          ; get current port B values
    ldi         r25, (1 << BUZZ_PIN)    ; LED pin number
    eor         r24, r25                ; toggle bit
    out         BUZZ_PORT, r24          ; write it back in place
    ret
