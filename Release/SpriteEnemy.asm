;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module SpriteEnemy
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SpriteManagerRemoveSprite
	.globl _PlayFx
	.globl _CheckCollision
	.globl _TranslateSprite
	.globl _SetSpriteAnim
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
;SpriteEnemy.c:17: void Start_SPRITE_ENEMY() {
;	---------------------------------
; Function Start_SPRITE_ENEMY
; ---------------------------------
_Start_SPRITE_ENEMY::
	add	sp, #-4
;SpriteEnemy.c:18: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
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
;SpriteEnemy.c:19: THIS->lim_x=9999;
	ld	hl,#0x0012
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x0f
	ld	(bc),a
	inc	bc
	ld	a,#0x27
	ld	(bc),a
;SpriteEnemy.c:20: THIS->lim_y=9999;
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
;SpriteEnemy.c:21: data->vy = 1;
	pop	hl
	push	hl
	ld	(hl),#0x01
;SpriteEnemy.c:23: SetSpriteAnim(THIS, anim_walk2, 15);
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
;SpriteEnemy.c:27: void Update_SPRITE_ENEMY() {
;	---------------------------------
; Function Update_SPRITE_ENEMY
; ---------------------------------
_Update_SPRITE_ENEMY::
	add	sp, #-4
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
;SpriteEnemy.c:34: if (TranslateSprite(THIS, 0 << delta_time, data->vy << delta_time)) {
	ld	a,(bc)
	ld	d,a
	ld	hl,#_delta_time
	ld	a,(hl)
	inc	a
	jr	00143$
00142$:
	sla	d
00143$:
	dec	a
	jr	NZ,00142$
	ld	a,(hl)
	push	af
	ld	e,#0x00
	pop	af
	inc	a
	jr	00145$
00144$:
	sla	e
00145$:
	dec	a
	jr	NZ,00144$
	push	bc
	push	de
	inc	sp
	ld	a,e
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
	jp	Z,00105$
;SpriteEnemy.c:36: data->vy = -data->vy;
	ld	a,(bc)
	ldhl	sp,#3
	ld	(hl),a
	xor	a, a
	sub	a, (hl)
	ld	(hl),a
	ld	a,(hl)
	ld	(bc),a
;SpriteEnemy.c:38: PlayFx(CHANNEL_4, 4, 0x0c, 0x41, 0x30, 0xc0);
	push	bc
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
	pop	bc
;SpriteEnemy.c:39: if (data->vy == -1) {
	ld	a,(bc)
	inc	a
	jr	NZ,00102$
;SpriteEnemy.c:40: SetSpriteAnim(THIS, anim_walk, 15);
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
	jr	00105$
00102$:
;SpriteEnemy.c:43: SetSpriteAnim(THIS, anim_walk2, 15);
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
00105$:
;SpriteEnemy.c:49: SPRITEMANAGER_ITERATE(i, spr) {
	ld	a, (#(_sprite_manager_updatables + 0x0001) + 0)
	ld	c,a
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_sprite_manager_sprites
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ldhl	sp,#1
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl-),a
	dec	hl
	ld	(hl),#0x00
00113$:
	ld	de, #_sprite_manager_updatables + 0
	ld	a,(de)
	ld	c,a
	ldhl	sp,#0
	ld	a,(hl)
	sub	a, c
	jp	Z,00115$
;SpriteEnemy.c:50: if (spr->type == SPRITE_BOMB || spr->type == SPRITE_BOMB_L) {
	ldhl	sp,#(2 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0010
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	sub	a, #0x06
	jr	Z,00108$
	ld	a,c
	sub	a, #0x07
	jp	NZ,00114$
00108$:
;SpriteEnemy.c:51: if (CheckCollision(THIS, spr)) {
	ldhl	sp,#1
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_CheckCollision
	add	sp, #4
	ld	a,e
	or	a, a
	jr	Z,00114$
;SpriteEnemy.c:52: SpriteManagerRemoveSprite(THIS);
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SpriteManagerRemoveSprite
	add	sp, #2
;SpriteEnemy.c:53: PlayFx(CHANNEL_1, 10, 0x1e, 0x10, 0xf3, 0x00, 0x87);
	ld	hl,#0x0087
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0xf3
	push	hl
	ld	l, #0x10
	push	hl
	ld	l, #0x1e
	push	hl
	ld	hl,#0x0a00
	push	hl
	call	_PlayFx
	add	sp, #12
;SpriteEnemy.c:54: SpriteManagerRemoveSprite(spr);
	ldhl	sp,#1
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SpriteManagerRemoveSprite
	add	sp, #2
00114$:
;SpriteEnemy.c:49: SPRITEMANAGER_ITERATE(i, spr) {
	ldhl	sp,#0
	inc	(hl)
	ld	c,(hl)
	ld	b,#0x00
	inc	bc
	ld	hl,#_sprite_manager_updatables
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	sla	c
	rl	b
	ld	hl,#_sprite_manager_sprites
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ldhl	sp,#1
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	jp	00113$
00115$:
	add	sp, #4
	ret
;SpriteEnemy.c:61: void Destroy_SPRITE_ENEMY() {
;	---------------------------------
; Function Destroy_SPRITE_ENEMY
; ---------------------------------
_Destroy_SPRITE_ENEMY::
;SpriteEnemy.c:62: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
