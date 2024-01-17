#include <16F84A.h>
#fuses XT,NOWDT,NOPUT,NOPROTECT
#use delay(clock=4000000)

void main()
{
	int 1 buton_oku;

	set_tris_b(0x00);
	set_tris_a(0x01);

	while(1)
	{
		buton_oku = input(pin_a0);
		output_b(pin_b0, !buton_oku);
	}
}
