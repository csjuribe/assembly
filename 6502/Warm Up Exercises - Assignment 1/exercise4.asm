	processor 6502
	seg Code				; Define a new segment named "Code"
	org $F000				; Define the origin of the ROM code at memory address $F000
	
Start:
	LDA #100				; Load the A register with the literal decimal value 1000
	
	CLC						; Clear the carry flag before calling ADC
	ADC #5					; Add the decimal value 5 to the accumulator
	
	SEC						; Set the carry flag before calling SBC
	SBC #10					; Subtract the decimal value 10 from the accumulator
							; Register A should now contain the decimal 95 (or $5F in hexadecimal)
	jmp Start
	
	org $FFFC				; End the ROM by adding requires values to memory position $FFFC
	.word Start				; Put 2 bytes with the reset address at memory position $FFFC
	.word Start				; Put 2 bytes with the break address at memory position $FFFE