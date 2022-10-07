	processor 6502
	seg Code				; Define a new segment named "Code"
	org $F000				; Define the origin of the ROM code at memory address $F000
	
Start:

	
	jmp Start
	
	org $FFFC				; End the ROM by adding requires values to memory position $FFFC
	.word Start				; Put 2 bytes with the reset address at memory position $FFFC
	.word Start				; Put 2 bytes with the break address at memory position $FFFE