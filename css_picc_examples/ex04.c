#include <16f84A.h>
#fuses XT,NOWDT,NOPUT,NOPROTECT
#use delay(clock=4000000)

#byte PORTA = 0X05

void main()
{
	set_tris_a(0x00);

	while(1)
	{
		bit_set(PORTA,0);
		delay_ms(1000);
		bit_clear(PORTA,0);
		delay_ms(1000);
	}
}
