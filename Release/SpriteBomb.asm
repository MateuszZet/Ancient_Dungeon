;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module SpriteBomb
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TranslateSprite
	.globl _SetSpriteAnim
	.globl _bank_SPRITE_BOMB
	.globl _anim_bomb
	.globl _Start_SPRITE_BOMB
	.globl _Update_SPRITE_BOMB
	.globl _Destroy_SPRITE_BOMB
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_BOMB::
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
;SpriteBomb.c:3: UINT8 bank_SPRITE_BOMB = 2;
	ld	hl,#_bank_SPRITE_BOMB
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
;SpriteBomb.c:14: void Start_SPRITE_BOMB() {
;	---------------------------------
; Function Start_SPRITE_BOMB
; ---------------------------------
_Start_SPRITE_BOMB::
	add	sp, #-4
;SpriteBomb.c:17: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
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
;SpriteBomb.c:18: THIS->lim_x = 9999;
	ld	hl,#0x0012
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x0f
	ld	(bc),a
	inc	bc
	ld	a,#0x27
	ld	(bc),a
;SpriteBomb.c:19: THIS->lim_y = 9999;
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
;SpriteBomb.c:21: data->vy = 1;
	pop	hl
	push	hl
	ld	(hl),#0x01
;SpriteBomb.c:22: SetSpriteAnim(THIS, anim_bomb, 5);
	ld	a,#0x05
	push	af
	inc	sp
	ld	hl,#_anim_bomb
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
_anim_bomb:
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
;SpriteBomb.c:26: void Update_SPRITE_BOMB() {
;	---------------------------------
; Function Update_SPRITE_BOMB
; ---------------------------------
_Update_SPRITE_BOMB::
;SpriteBomb.c:27: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0018
	add	hl,bc
	ld	c,l
	ld	b,h
;SpriteBomb.c:28: TranslateSprite(THIS, 0, data->vy);
	ld	a,(bc)
	ld	b,a
	push	bc
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
	ret
;SpriteBomb.c:33: void Destroy_SPRITE_BOMB() {
;	---------------------------------
; Function Destroy_SPRITE_BOMB
; ---------------------------------
_Destroy_SPRITE_BOMB::
;SpriteBomb.c:37: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
