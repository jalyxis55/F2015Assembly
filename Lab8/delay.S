;delay.S

#include	<avr/io.h>

	.section	.text
	.global		delay

delay:
	ldi	r16, 50		;outer loop
1:
	ldi	r17, 255	;middle loop
2:
	ldi	r18, 255	;inner loop
3:
	dec	r18
	brne	3b		;inner loop
	dec	r17
	brne	2b		;middle loop
	dec	r16
	brne	1b		;outer loop
	ret