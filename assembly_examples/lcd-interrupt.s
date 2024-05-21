#include p16f84a.inc ; include

;  _   _ _    __ _ _   _   __  __ _   _ __   __   __
;  \ \ / // \  / _|_ | \ | | / _|| __| \ | / __| / _ \ \ / /
;   \ V // _ \ \_ \| ||  \| | \_ \|  | |  \| \__ \| | | \ V / 
;   | |/ _ \ _) | || |\  |  _) | |_| |\  |_) | |_| || |  
;   |//   \\_/_|| \| |_/|_|| \|_/ \_/ |_|  


;Tanmlamalar
PORTA	EQU	0x05 ; Porta Register Degeri
PORTB	EQU	0x06 ; Portb Register Degeri
TRISA	EQU	0x85 ; Trisa Register Degeri
TRISB	EQU	0x86 ; Trisb Register Degeri
STATUS	EQU	0x03 ; Status Register Degeri
PCL	EQU	0x02 ; Program Counter Length Register
sayac	EQU	0x0C ; Sayac Register

; Reset Vector
RST   code  0x0

PGM   code

	ORG	0x00
	GOTO	BASLA
	ORG	h'04'
	GOTO	MY_INTERRUPT
	
	
BASLA
	CLRF	PORTB		; Portb yi temizle
	BSF	STATUS,5 	; bank1'e ge
	MOVLW	0x01
	MOVWF	TRISB		; RB0 Giri, Dierleri k
	MOVLW	b'10111111'	; Rb0 Den Kenar
	MOVWF	OPTION_REG
	BCF	STATUS,5	; bank0'a ge
	
	BCF INTCON,1		; INTF = Flag0'land
	BSF INTCON,7		;GIE=1 Interrupt izni.
	BSF INTCON,4		; RB0,INTE izni.

MAIN_LOOP
	 BTFSC	PORTA,0		; RA0 Butonuna basld m? Basldysa 2 alt satr (2 cycle)
	 GOTO	MAIN_LOOP	; Baslmadysa Ana Dngye devam et (1 cycle)
	 GOTO	DISPLAY_START	; Basldysa Program balat

DISPLAY_START
	MOVLW	0x00
	CALL	MY_FUNCTION
	MOVWF	PORTB
	CALL	DELAY
	
	MOVLW	0x01
	CALL	MY_FUNCTION
	MOVWF	PORTB
	CALL	DELAY
	
	MOVLW	0x02
	CALL	MY_FUNCTION
	MOVWF	PORTB
	CALL	DELAY
	
	MOVLW	0x03
	CALL	MY_FUNCTION
	MOVWF	PORTB
	CALL	DELAY
	
	MOVLW	0x04
	CALL	MY_FUNCTION
	MOVWF	PORTB
	CALL	DELAY
	
	GOTO	DISPLAY_START

MY_FUNCTION
    ADDWF	PCL,1   ; PCL + w = PCL
    RETLW	0xDC    ; Y
    RETLW	0xEE    ; A
    RETLW	0xDA	; S
    RETLW       0x0C	; I
    RETLW   	0x6E    ; n
    
    
DELAY
	MOVLW	0XFF
	MOVWF	sayac

TEKRAR
	DECFSZ	sayac,1
	GOTO	TEKRAR
	RETFIE
	
MY_INTERRUPT
	MOVLW	b'00000000'
	MOVWF	PORTB
	BTFSC   PORTA,0
	GOTO	MY_INTERRUPT
	
	BCF	INTCON,INTF
	
	RETFIE
;====================================================================
      END
