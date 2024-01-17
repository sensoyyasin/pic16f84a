#include <16f84A.h>
#fuses XT,NOWDT,NOPUT,NOPROTECT
#use delay(clock=4000000)

void main()
{
	int8 i;
	int8 yaz[4] = {0x3F, 0X06, 0X5B, 0X4F};

	while(1)
	{
		if (i == 4)
			i = 0;
		output_b(yaz[i]);
		delay_ms(1000);
		i++;
	}
}
