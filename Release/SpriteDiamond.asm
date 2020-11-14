;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module SpriteDiamond
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SetSpriteAnim
	.globl _bank_SPRITE_DIAMOND
	.globl _anim_diamond
	.globl _Start_SPRITE_DIAMOND
	.globl _Update_SPRITE_DIAMOND
	.globl _Destroy_SPRITE_DIAMOND
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_DIAMOND::
	.ds 1
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
;SpriteDiamond.c:3: UINT8 bank_SPRITE_DIAMOND = 2;
	ld	hl,#_bank_SPRITE_DIAMOND
	ld	(hl),#0x02
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_2
;SpriteDiamond.c:14: void Start_SPRITE_DIAMOND() {
;	---------------------------------
; Function Start_SPRITE_DIAMOND
; ---------------------------------
_Start_SPRITE_DIAMOND::
	add	sp, #-4
;SpriteDiamond.c:15: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0018
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#2
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
;SpriteDiamond.c:16: THIS->lim_x = 9999;
	ld	hl,#0x0012
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x0f
	ld	(bc),a
	inc	bc
	ld	a,#0x27
	ld	(bc),a
;SpriteDiamond.c:17: THIS->lim_y = 9999;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0014
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x0f
	ld	(bc),a
	inc	bc
	ld	a,#0x27
	ld	(bc),a
;SpriteDiamond.c:18: data->vy = 1;
	pop	hl
	push	hl
	ld	(hl),#0x01
;SpriteDiamond.c:19: SetSpriteAnim(THIS, anim_diamond, 20);
	ld	a,#0x14
	push	af
	inc	sp
	ld	hl,#_anim_diamond
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
	add	sp, #4
	ret
_anim_diamond:
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
;SpriteDiamond.c:22: void Update_SPRITE_DIAMOND() {
;	---------------------------------
; Function Update_SPRITE_DIAMOND
; ---------------------------------
_Update_SPRITE_DIAMOND::
;SpriteDiamond.c:24: }
	ret
;SpriteDiamond.c:26: void Destroy_SPRITE_DIAMOND() {
;	---------------------------------
; Function Destroy_SPRITE_DIAMOND
; ---------------------------------
_Destroy_SPRITE_DIAMOND::
;SpriteDiamond.c:28: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
