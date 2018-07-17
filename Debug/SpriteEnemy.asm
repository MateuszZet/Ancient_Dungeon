;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module SpriteEnemy
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TranslateSprite
	.globl _bank_SPRITE_ENEMY
	.globl _Start_SPRITE_ENEMY
	.globl _Update_SPRITE_ENEMY
	.globl _Destroy_SPRITE_ENEMY
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_ENEMY::
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
;SpriteEnemy.c:3: UINT8 bank_SPRITE_ENEMY = 2;
	ld	hl,#_bank_SPRITE_ENEMY
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
;SpriteEnemy.c:11: void Start_SPRITE_ENEMY() {
;	---------------------------------
; Function Start_SPRITE_ENEMY
; ---------------------------------
_Start_SPRITE_ENEMY::
;SpriteEnemy.c:12: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0018
	add	hl,bc
	ld	c,l
	ld	b,h
;SpriteEnemy.c:13: data->vy = 1;
	ld	a,#0x01
	ld	(bc),a
	ret
;SpriteEnemy.c:16: void Update_SPRITE_ENEMY() {
;	---------------------------------
; Function Update_SPRITE_ENEMY
; ---------------------------------
_Update_SPRITE_ENEMY::
	dec	sp
;SpriteEnemy.c:17: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0018
	add	hl,bc
	ld	c,l
	ld	b,h
;SpriteEnemy.c:18: if(TranslateSprite(THIS, 0, data->vy)) {
	ld	a,(bc)
	ld	d,a
	push	bc
	push	de
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_TranslateSprite
	add	sp, #4
	pop	bc
	ld	a,e
	or	a, a
	jr	Z,00103$
;SpriteEnemy.c:19: data->vy = -data->vy;
	ld	a,(bc)
	ldhl	sp,#0
	ld	(hl),a
	xor	a, a
	sub	a, (hl)
	ld	(hl),a
	ld	a,(hl)
	ld	(bc),a
00103$:
	inc	sp
	ret
;SpriteEnemy.c:23: void Destroy_SPRITE_ENEMY() {
;	---------------------------------
; Function Destroy_SPRITE_ENEMY
; ---------------------------------
_Destroy_SPRITE_ENEMY::
;SpriteEnemy.c:24: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
