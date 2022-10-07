	processor 6502
	
	seg code
	org $F000		; Start of ROM cartridge at $F000
	
Start:
	sei				; Disable interrupts
	cld				; Disable the BCD math mode
	ldx #$FF		; Loads the X Register with #$FF
	txs				; Transfer X Register to the Stack Pointer
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the Page Zero region of memory($00 to $FF)
; Meaning the entire RAM and also the entire TIA registers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	lda #0			; A = 0
	ldx #$FF		; X = #$FF
MemLoop:
	sta $0,X		; Store the value of A inside Memory Address $0 + X
	dex				; X--
	bne MemLoop		; Loop until X is equal to zero (z-flag is set)
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; Fill the ROM to size exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	org $FFFC
	.word Start		; Reset vector at $FFFC (Where the program starts)
	.word Start 	; Interrupt vector at $FFFE (unused in the VCS)