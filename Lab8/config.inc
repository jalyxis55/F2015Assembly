;configurartion for blink

#include	<avr/io.h>

#define	LED_PIN		5
#define	LED_DIR		_SFR_IO_ADDR(DDRB)
#define	LED_PORT	_SFR_IO_ADDR(PORTB)

#define	_SREG		_SFR_IO_ADDR(SREG)
#define	_SPH		_SFR_IO_ADDR(SPH)
#define	_SPL		_SFR_IO_ADDR(SPL)
