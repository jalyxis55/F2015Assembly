
; config.inc - pin assignments for this project

#include <avr/io.h>
#include "/usr/local/include/special_regs.inc"


#define     LED_PORT   _PORTB
#define     LED_DIR    _DDRB
#define     LED_PIN    5

#define     BUZZ_PORT  _PORTD
#define     BUZZ_DIR   _DDRD
#define     BUZZ_PIN1  7

#define     PULSE_DIR  _DDRB
#define     PULSE_PORT _PORTB
#define     PULSE_PIN  4
