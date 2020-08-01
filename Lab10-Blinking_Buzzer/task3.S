#include "config.inc"

; Task 3 - Servo task - service at 50Hz

            .global     Task3
            .global     Task3_init

.equ        TASK3_MAX,  160

            .section    .data
Task3countH:
            .byte       0
Task3countL:
            .byte       0

            .section    .text

Task3_init:
            sts         Task3countH, r1         ; clear counter
            sts         Task3countL, r1
            sbi         PULSE_DIR, PULSE_PIN
            ret

Task3:
            lds         r26, Task3countL        ; load counter into X
            lds         r27, Task3countH
            adiw        r26, 1                  ; increment counter
            sts         Task3countL, r26        ; save it back
            sts         Task3countH, r27 
            ;
            cpi         r26, TASK3_MAX & 0xff   ; Compare low byte
            ldi         r16, TASK3_MAX >> 8
            cpc         r27, r16                ; Compare high byte
            brne        1f                      ; branch if not equal
            ;
            in          r16, PULSE_PORT         ; toggle LED pin
            ldi         r17, (1<<PULSE_PIN)
            eor         r16, r17                ; flip the LED bit
            ;
            out         PULSE_PORT, r16         ; set the LED pin
            sts         Task3countL, r1         ; and clear the counter
            sts         Task3countH, r1
1:
            ret
