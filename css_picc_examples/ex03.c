#include <16f84A.h>
#fuses XT,NOWDT,NOPUT,NOPROTECT
#use delay(clock=4000000)

void main()
{
	int8	sat[] = {0x03,0x3A,0x3B,0x3A,0x03};
	int8	sut[] = {0x01,0x02,0x04,0x08,0x10};

	int8	i;

	set_tris_a(0x00);
	set_tris_b(0x00);

	i = 0;
	while(1)
	{
		if (i == 5)
			i = 0;
		output_a(sut[i]);
		output_b(sat[i]);
		delay_ms(1000);
		i++;
	}
}
