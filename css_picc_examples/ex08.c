#include <16f84A.h>
#fuses XT,NOWDT,NOPUT,NOPROTECT
#use delay(clock=4000000)

#byte PORTA = 0X05
#byte PORTB = 0X06

void main()
{
	int8 sifre;
	int8 veri;

	set_tris_a(0x0F); //00001111
	set_tris_b(0x00);

	sifre = 10;
	veri = 0;
	
	while(1)
	{
		veri = input_a();
		if (veri == sifre)
			bit_set(PORTB,0);
		else
			bit_clear(PORTB,0);
	}
}
