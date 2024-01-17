#include <16f84A.h>
#fuses XT,NOWDT,NOPUT,NOPROTECT
#use delay(clock=4000000)

#byte PORTA = 0X05
#byte PORTB = 0X06

void main()
{
	set_tris_a(0x01);
	set_tris_b(0x00);

	while(1)
	{
		if (bit_test(PORTA,0))
			bit_set(PORTB,0);
		else
			bit_clear(PORTB,0);
		delay_ms(500);
	}
}
