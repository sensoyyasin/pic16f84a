#include <16f84A.h>
#fuses XT,NOWDT,NOPUT,NOPROTECT
#use delay(clock=4000000)

void main()
{
	int8 A[3] = {0X04, 0X02, 0X01};
	int8 B[5] = {0X79, 0X50, 0X6D, 0X3F, 0X6E};
	int8 i,j,veri;

	i = 0;
	j = 0;
	
	set_tris_a(0x00);
	set_tris_b(0x00);

	while(1)
	{
		if (i == 3)
		{
			j++;
			i = 1;
		}
		
		if (j == 4)
		{
			j = 0;
			veri = B[0];
			B[0] = B[1];
			B[1] = B[2];
			B[2] = B[3];
			B[3] = B[4];
			B[4] = veri;
		}
		output_a(A[i]);
		output_b(B[i]);
		i++;
		delay_ms(1000);
	}
}
