;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module SpriteDoorOpen
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _bank_SPRITE_DOOROPEN
	.globl _Start_SPRITE_DOOROPEN
	.globl _Update_SPRITE_DOOROPEN
	.globl _Destroy_SPRITE_DOOROPEN
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_DOOROPEN::
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
;SpriteDoorOpen.c:3: UINT8 bank_SPRITE_DOOROPEN = 2;
	ld	hl,#_bank_SPRITE_DOOROPEN
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
;SpriteDoorOpen.c:12: void Start_SPRITE_DOOROPEN() {
;	---------------------------------
; Function Start_SPRITE_DOOROPEN
; ---------------------------------
_Start_SPRITE_DOOROPEN::
	add	sp, #-4
;SpriteDoorOpen.c:13: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
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
;SpriteDoorOpen.c:14: THIS->lim_x = 9999;
	ld	hl,#0x0012
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x0f
	ld	(bc),a
	inc	bc
	ld	a,#0x27
	ld	(bc),a
;SpriteDoorOpen.c:15: THIS->lim_y = 9999;
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
;SpriteDoorOpen.c:17: data->vy = 1;
	pop	hl
	push	hl
	ld	(hl),#0x01
	add	sp, #4
	ret
;SpriteDoorOpen.c:20: void Update_SPRITE_DOOROPEN() {
;	---------------------------------
; Function Update_SPRITE_DOOROPEN
; ---------------------------------
_Update_SPRITE_DOOROPEN::
;SpriteDoorOpen.c:22: }
	ret
;SpriteDoorOpen.c:24: void Destroy_SPRITE_DOOROPEN() {
;	---------------------------------
; Function Destroy_SPRITE_DOOROPEN
; ---------------------------------
_Destroy_SPRITE_DOOROPEN::
;SpriteDoorOpen.c:26: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
