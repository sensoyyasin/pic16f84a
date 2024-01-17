#include <16f84A.h>
#fuses XT,NOWDT,NOPUT,NOPROTECT
#use delay(clock=4000000)

#byte PORTB = 0X06

void main()
{
	int8 veri;
	int8 a;

	set_tris_b(0x00);

	veri = 1;
	a = 0;
	
	while (1)
	{
		if (a == 1)
			veri = veri << 1;
		if (a == 2)
			veri = veri >> 1;
		if (veri == 1)
			a = 1; //00000001
		if (veri == 128)
			a = 2; //10000000

		output_b(veri);
		delay_ms(1000);
	}
}
