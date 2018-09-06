;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module SpriteBomb_L
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Destroy_SPRITE_BOMB_L
	.globl _Update_SPRITE_BOMB_L
	.globl _Start_SPRITE_BOMB_L
	.globl _TranslateSprite
	.globl _SetSpriteAnim
	.globl _bank_SPRITE_BOMB_L
	.globl _anim_bomb
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_BOMB_L::
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
;SpriteBomb_L.c:3: UINT8 bank_SPRITE_BOMB_L = 2;
	ld	hl,#_bank_SPRITE_BOMB_L
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
;SpriteBomb_L.c:17: void Start_SPRITE_BOMB_L() {
;	---------------------------------
; Function Start_SPRITE_BOMB_L
; ---------------------------------
_Start_SPRITE_BOMB_L::
	add	sp, #-4
;SpriteBomb_L.c:20: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
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
;SpriteBomb_L.c:22: THIS->lim_x = 9999;
	ld	hl,#0x0012
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x0f
	ld	(bc),a
	inc	bc
	ld	a,#0x27
	ld	(bc),a
;SpriteBomb_L.c:23: THIS->lim_y = 9999;
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
;SpriteBomb_L.c:25: data->vy = 2;
	pop	hl
	push	hl
	ld	(hl),#0x02
;SpriteBomb_L.c:26: data->vx = 2;
	pop	bc
	push	bc
	inc	bc
	ld	a,#0x02
	ld	(bc),a
;SpriteBomb_L.c:28: SetSpriteAnim(THIS, anim_bomb, 15);
	ld	a,#0x0f
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
;SpriteBomb_L.c:33: void Update_SPRITE_BOMB_L() {
;	---------------------------------
; Function Update_SPRITE_BOMB_L
; ---------------------------------
_Update_SPRITE_BOMB_L::
;SpriteBomb_L.c:34: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0018
	add	hl,bc
	ld	c,l
	ld	b,h
;SpriteBomb_L.c:35: TranslateSprite(THIS, -data->vx << delta_time, 0);
	inc	bc
	ld	a,(bc)
	ld	c,a
	xor	a, a
	sub	a, c
	ld	b,a
	ld	hl,#_delta_time
	ld	a,(hl)
	inc	a
	jr	00104$
00103$:
	sla	b
00104$:
	dec	a
	jr	NZ,00103$
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_TranslateSprite
	add	sp, #4
	ret
;SpriteBomb_L.c:39: void Destroy_SPRITE_BOMB_L() {
;	---------------------------------
; Function Destroy_SPRITE_BOMB_L
; ---------------------------------
_Destroy_SPRITE_BOMB_L::
;SpriteBomb_L.c:43: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
