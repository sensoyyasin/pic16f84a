	LIST	P=16F84A

PORTA	EQU	0X05
PORTB	EQU	0X06
TRISA	EQU	0X85
TRISB	EQU	0X86
INDF	EQU	0X00
FSR	EQU	0X04
sayac	EQU	0X0C

	CBLOCK	0X20
	x
	y
	z
	k
	ENDC

	ORG	0
	CALL	DIZI
	
	CLRF	PORTB
	BSF	STATUS,5
	CLRF	TRISB
	BCF	STATUS,5

ANA
	MOVLW	0X20
	MOVWF	FSR

loop
	MOVF	INDF,W
	MOVWF	PORTB
	CALL	GECIKME
	INCF	FSR,F
	BTFSS	FSR,2
	GOTO	loop
	GOTO	ANA

DIZI
	MOVLW	0X3F
	MOVWF	x
	MOVLW	0x06
	MOVWF	y
	MOVLW	0X5B
	MOVWF	z
	MOVLW	0X4F
	MOVWF	k
	RETURN

GECIKME
	MOVLW	0XFF
	MOVWF	sayac

TEKRAR
	DECFSZ	sayac,1
	GOTO	TEKRAR
	RETURN
END