;PIC16F84'e enerji verildiğide A portundaki tüm ledler sönükken B portunun 0.bitine bağlı (RB1) bir butona basıldığında A portuna bağlı ledler yansın.
; daha harici kesme ile (RB0/INT) ledler tekrar söndürülsün. Kesme, kesme sinyalinin düşen kenarında gerçekleşsin.

LIST	P=16F84A
INCLUDE "P16F84A.INC"

PORTA	EQU	0X05
PORTB	EQU	0X06
TRISA	EQU	0X85
TRISB	EQU	0X86
STATUS	EQU	0X03
SAYAC1	EQU	0X0C
SAYAC2	EQU	0X0D

ORG	0x00
GOTO	BASLA
ORG	0x04
GOTO	INTERRUPT_ALT_PROGRAM

BASLA
	BSF	STATUS,5
	CLRF	TRISA
	MOVLW	0xFF
	MOVWF	TRISB
	MOVLW	b'10111111'
	MOVWF	OPTION_REG
	BCF	STATUS,5
	CLRF	PORTA
	
	BCF	INTCON,1 ;INF Flag = 0;
	BSF	INTCON,4 ;Global kesmeeyi aktifleştir.
	BSF	INTCON,7 ;Harici kesmeyi aktifleştir.

TEST_PORTB
	BTFSS	PORTB,0
	GOTO	TEST_PORTB
	MOVLW	0xFF
	MOVWF	PORTA ;A daki tüm ledleri yak
	GOTO	TEST_PORTB

INTERRUPT_ALT_PROGRAM
	BCF	INTCON,1
	MOVLW	0x00
	MOVWF	PORTA
	RETFIE

END
