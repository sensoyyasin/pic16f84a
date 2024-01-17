	LIST	P=16F84A

PORTB	EQU	0X06
TRISB	EQU	0X86
STATUS	EQU	0X03

	ORG	0
	CLRF	PORTB
	BSF	STATUS,5
	CLRF	TRISB
	MOVLW	0XFF
	MOVWF	TRISA
	BCF	STATUS,5

LOOP
	BCF	PORTB,0

SOR
	BTFSC	PORTA,0
	GOTO	SOR
	BSF	PORTB,0
	GOTO	LOOP
	END
