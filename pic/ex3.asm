	LIST	P=16F84A
PORTB	EQU	0X06
TRISB	EQU	0X86
STATUS	EQU	0X03
sayac	EQU	0X0C

	ORG	0
	CLRF	PORTB
	BSF	STATUS,5
	CLRF	TRISB
	BCF	STATUS,5

LOOP
	MOVLW	0X3F ;0 -> 7-segment display
	MOVWF	PORTB
	CALL	GECIKME
	MOVLW	0X06 ;1
	MOVWF	PORTB
	CALL	GECIKME
	MOVLW	0X5B;2
	MOVWF	PORTB
	CALL	GECIKME
	MOVLW	0X4F;3
	MOVWF	PORTB
	CALL	GECIKME
	GOTO	LOOP

GECIKME
	MOVLWF	0XFF
	MOVWF	sayac

TEKRAR
	DEVFSZ	sayac,1
	GOTO	TEKRAR
	RETURN
END
	