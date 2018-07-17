;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module ZGBMain
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GetTileReplacement
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;ZGBMain.c:4: UINT8 GetTileReplacement(UINT8* tile_ptr, UINT8* tile) {
;	---------------------------------
; Function GetTileReplacement
; ---------------------------------
_GetTileReplacement::
	add	sp, #-3
;ZGBMain.c:5: if(current_state == STATE_GAME) {
	ld	hl,#_current_state
	ld	a,(hl)
	or	a, a
	jp	NZ,00104$
;ZGBMain.c:6: if(U_LESS_THAN(255 - (UINT16)*tile_ptr, N_SPRITE_TYPES)) {
	ldhl	sp,#(6 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(bc)
	ldhl	sp,#2
	ld	(hl),a
	ld	a,(hl-)
	dec	hl
	ld	(hl+),a
	ld	(hl),#0x00
	ld	de,#0x00fd
	pop	hl
	push	hl
	ld	a,e
	sub	a,l
	ld	e,a
	ld	a,d
	sbc	a,h
	ldhl	sp,#1
	ld	(hl-),a
	ld	(hl),e
;ZGBMain.c:7: *tile = 0;
	ldhl	sp,#(8 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;ZGBMain.c:6: if(U_LESS_THAN(255 - (UINT16)*tile_ptr, N_SPRITE_TYPES)) {
	ldhl	sp,#1
	bit	7, (hl)
	jr	Z,00102$
;ZGBMain.c:7: *tile = 0;
	xor	a, a
	ld	(de),a
;ZGBMain.c:8: return 255 - (UINT16)*tile_ptr;
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ld	a,#0xff
	sub	a, c
	ld	e,a
	jr	00105$
00102$:
;ZGBMain.c:11: *tile = *tile_ptr;
	ldhl	sp,#2
	ld	a,(hl)
	ld	(de),a
00104$:
;ZGBMain.c:14: return 255u;
	ld	e,#0xff
00105$:
	add	sp, #3
	ret
	.area _CODE
	.area _CABS (ABS)
