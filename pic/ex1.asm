list p=16f84A
;include P16F84A.INC
__config _XT_OSC & _PWRTE_OFF & _WDT_OFF & _CP_OFF

porta equ 0x05
portb equ 0x06
trisa equ 0x85
trisb equ 0x86
sayici equ 0x10
zaman equ 0x11

org 0
bsf STATUS,5
clrf trisa
clrf trisb
bcf STATUS,5
clrf porta
clrf portb
clrf sayici
ana incf sayici,1
movf sayici,0
movwf portb
call gecikme
goto ana
gecikme movlw h'FF'
movwf zaman
cevrim decfsz zaman,1
goto cevrim
return
end
