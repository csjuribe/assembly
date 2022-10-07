	processor 6502
	
	include "vcs.h"
	include "macro.h"
	
	seg Code				; Define a new segment named "Code"
	org $F000				; Define the origin of the ROM code at memory address $F000
	
Start:
	CLEAN_START				; Macro to safely clear the memory
	
;;;;;
; Set Luminosity to Yello
;;;;;;;;
	LDA #$1E				; Load color into A ($1E is NTSC Yellow)
	STA COLUBK				; Store A to BackgroundColor Address $09
	
	jmp Start
	
	org $FFFC				; End the ROM by adding requires values to memory position $FFFC
	.word Start				; Put 2 bytes with the reset address at memory position $FFFC
	.word Start				; Put 2 bytes with the break address at memory position $FFFE