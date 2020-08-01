; config.inc - pin assignments for this project

#include <avr/io.h>
#include "/usr/local/include/special_regs.inc"

#define     RED_LED_PORT   _PORTB
#define     RED_LED_DIR    _DDRB
#define     RED_LED_PIN    5

#define     GREEN_LED_PORT   _PORTC
#define     GREEN_LED_DIR    _DDRC
#define     GREEN_LED_PIN    7

#define     ECHO_DDR    _DDRD
#define     ECHO_PORT   _PORTD
#define     ECHO_PIN    2
#define     TRIG_PIN    1
