#include <16f84A.h>
#fuses XT,NOWDT,NOPUT,NOPROTECT
#use delay(clock=4000000)

#byte PORT = 0X05
#byte PORT = 0X06

void main()
{
	int8 sayici;
	int1 flag;

	sayici = 0;
	flag = 0;

	set_tris_a(0x03); //00000011 -> RA0,RA1 input
	set_tris_b(0x00); //00000000 -> All of them output

	while(1)
	{
		if (bit_test(PORTA,0) && (flag == 0))
		{
			sayici++;
			flag = 1;
		}

		if (bit_test(PORTA,1) && (flag == 0))
		{
			sayici--;
			flag = 1;
		}

		if (!bit_test(PORTA,0) && !bit_test(PORTA,1))
			flag = 0;

		output_b(sayici);
		delay_ms(1000);
	}
}
