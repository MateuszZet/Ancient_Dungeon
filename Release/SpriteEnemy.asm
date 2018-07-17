;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module SpriteEnemy
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _variable
	.globl _PlayFx
	.globl _TranslateSprite
	.globl _SetSpriteAnim
	.globl _dir_pointer
	.globl _dir
	.globl _bank_SPRITE_ENEMY
	.globl _anim_walk
	.globl _anim_walk2
	.globl _Start_SPRITE_ENEMY
	.globl _Update_SPRITE_ENEMY
	.globl _Destroy_SPRITE_ENEMY
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_ENEMY::
	.ds 1
_dir::
	.ds 2
_dir_pointer::
	.ds 2
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
;SpriteEnemy.c:11: int dir=0;
	ld	hl,#_dir
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;SpriteEnemy.c:12: int *dir_pointer = NULL;
	ld	hl,#_dir_pointer
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_2
;SpriteEnemy.c:21: void Start_SPRITE_ENEMY() {
;	---------------------------------
; Function Start_SPRITE_ENEMY
; ---------------------------------
_Start_SPRITE_ENEMY::
	add	sp, #-4
;SpriteEnemy.c:22: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
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
;SpriteEnemy.c:23: THIS->lim_x=9999;
	ld	hl,#0x0012
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x0f
	ld	(bc),a
	inc	bc
	ld	a,#0x27
	ld	(bc),a
;SpriteEnemy.c:24: THIS->lim_y=9999;
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
;SpriteEnemy.c:25: data->vy = 1;
	pop	hl
	push	hl
	ld	(hl),#0x01
;SpriteEnemy.c:27: SetSpriteAnim(THIS, anim_walk2, 15);
	ld	a,#0x0f
	push	af
	inc	sp
	ld	hl,#_anim_walk2
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
_anim_walk2:
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
_anim_walk:
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
;SpriteEnemy.c:31: void Update_SPRITE_ENEMY() {
;	---------------------------------
; Function Update_SPRITE_ENEMY
; ---------------------------------
_Update_SPRITE_ENEMY::
	dec	sp
;SpriteEnemy.c:32: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0018
	add	hl,bc
	ld	c,l
	ld	b,h
;SpriteEnemy.c:33: dir_pointer = &dir;
	ld	hl,#_dir_pointer
	ld	(hl),#<(_dir)
	inc	hl
	ld	(hl),#>(_dir)
;SpriteEnemy.c:35: if(TranslateSprite(THIS, 0, data->vy)) {
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
	jp	Z,00106$
;SpriteEnemy.c:37: data->vy = -data->vy;
	ld	a,(bc)
	ldhl	sp,#0
	ld	(hl),a
	xor	a, a
	sub	a, (hl)
	ld	(hl),a
	ld	a,(hl)
	ld	(bc),a
;SpriteEnemy.c:39: PlayFx(CHANNEL_4, 4, 0x0c, 0x41, 0x30, 0xc0);
	ld	hl,#0x00c0
	push	hl
	ld	l, #0x30
	push	hl
	ld	l, #0x41
	push	hl
	ld	l, #0x0c
	push	hl
	ld	hl,#0x0403
	push	hl
	call	_PlayFx
	add	sp, #10
;SpriteEnemy.c:40: if (dir == 0 ) {
	ld	hl,#_dir + 1
	ld	a,(hl-)
	or	a,(hl)
	jr	NZ,00102$
;SpriteEnemy.c:41: SetSpriteAnim(THIS, anim_walk, 15);
	ld	a,#0x0f
	push	af
	inc	sp
	ld	hl,#_anim_walk
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
;SpriteEnemy.c:42: *dir_pointer = 1;
	ld	hl,#_dir_pointer + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x01
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
	jr	00106$
00102$:
;SpriteEnemy.c:45: SetSpriteAnim(THIS, anim_walk2, 15);
	ld	a,#0x0f
	push	af
	inc	sp
	ld	hl,#_anim_walk2
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
;SpriteEnemy.c:46: *dir_pointer = 0;
	ld	hl,#_dir_pointer + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x00
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
00106$:
	inc	sp
	ret
;SpriteEnemy.c:53: int variable(int dir) {
;	---------------------------------
; Function variable
; ---------------------------------
_variable::
;SpriteEnemy.c:54: return dir;
	pop	bc
	pop	de
	push	de
	push	bc
	ret
;SpriteEnemy.c:57: void Destroy_SPRITE_ENEMY() {
;	---------------------------------
; Function Destroy_SPRITE_ENEMY
; ---------------------------------
_Destroy_SPRITE_ENEMY::
;SpriteEnemy.c:58: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
