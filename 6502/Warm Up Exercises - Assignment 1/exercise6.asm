	processor 6502
	seg Code				; Define a new segment named "Code"
	org $F000				; Define the origin of the ROM code at memory address $F000
	
Start:
	lDA #1					; Load the A register with the decimal value 1
	LDX #2					; Load the X register with the decimal value 2
	LDY #3					; Load the Y register with the decimal value 3
	INX						; Increment X
	INY						; Increment Y
	CLC						; Clear carry flag
	ADC #1					; Increment A
							
	DEX						; Decrement X
	DEY						; Decrement Y
	SEC						; Set Carry flag
	SBC #1					; Decrement A
	
	jmp Start
	
	org $FFFC				; End the ROM by adding requires values to memory position $FFFC
	.word Start				; Put 2 bytes with the reset address at memory position $FFFC
	.word Start				; Put 2 bytes with the break address at memory position $FFFE