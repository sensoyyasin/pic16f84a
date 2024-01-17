#include <16f84A.h>
#fuses XT,NOWDT,NOPUT,NOPROTECT
#use delay(clock=4000000)

#byte PORTB = 0X06

void main()
{
	int8 rakam[10] = {0x06,0x5B,0X4F,0X66,0X6D,0X7D,0X07,0X7F,0X6F};
	int8 i;

	set_tris_b(0x00);
	i = 0;

	while(1)
	{
		if (i == 9)
			i = 0;
		output_b(rakam[i]);
		delay_ms(1000);
		i++;
	}
}
