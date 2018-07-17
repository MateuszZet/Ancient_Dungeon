;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module SpriteKey
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SetSpriteAnim
	.globl _bank_SPRITE_KEY
	.globl _anim_key
	.globl _Start_SPRITE_KEY
	.globl _Update_SPRITE_KEY
	.globl _Destroy_SPRITE_KEY
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_KEY::
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
;SpriteKey.c:3: UINT8 bank_SPRITE_KEY = 2;
	ld	hl,#_bank_SPRITE_KEY
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
;SpriteKey.c:14: void Start_SPRITE_KEY() {
;	---------------------------------
; Function Start_SPRITE_KEY
; ---------------------------------
_Start_SPRITE_KEY::
	add	sp, #-4
;SpriteKey.c:16: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
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
;SpriteKey.c:17: THIS->lim_x = 9999;
	ld	hl,#0x0012
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x0f
	ld	(bc),a
	inc	bc
	ld	a,#0x27
	ld	(bc),a
;SpriteKey.c:18: THIS->lim_y = 9999;
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
;SpriteKey.c:20: data->vy = 1;
	pop	hl
	push	hl
	ld	(hl),#0x01
	add	sp, #4
	ret
_anim_key:
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
;SpriteKey.c:23: void Update_SPRITE_KEY() {
;	---------------------------------
; Function Update_SPRITE_KEY
; ---------------------------------
_Update_SPRITE_KEY::
;SpriteKey.c:24: SetSpriteAnim(THIS, anim_key, 15);
	ld	a,#0x0f
	push	af
	inc	sp
	ld	hl,#_anim_key
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
	ret
;SpriteKey.c:27: void Destroy_SPRITE_KEY() {
;	---------------------------------
; Function Destroy_SPRITE_KEY
; ---------------------------------
_Destroy_SPRITE_KEY::
;SpriteKey.c:31: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
