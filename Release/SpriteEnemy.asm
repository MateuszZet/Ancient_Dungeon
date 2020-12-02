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
;SpriteEnemy.c:12: int dir=0;
	ld	hl,#_dir
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;SpriteEnemy.c:13: int *dir_pointer = NULL;
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
;SpriteEnemy.c:19: void Start_SPRITE_ENEMY() {
;	---------------------------------
; Function Start_SPRITE_ENEMY
; ---------------------------------
_Start_SPRITE_ENEMY::
	add	sp, #-4
;SpriteEnemy.c:20: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
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
;SpriteEnemy.c:21: THIS->lim_x=9999;
	ld	hl,#0x0012
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x0f
	ld	(bc),a
	inc	bc
	ld	a,#0x27
	ld	(bc),a
;SpriteEnemy.c:22: THIS->lim_y=9999;
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
;SpriteEnemy.c:23: data->vy = 1;
	pop	hl
	push	hl
	ld	(hl),#0x01
;SpriteEnemy.c:25: SetSpriteAnim(THIS, anim_walk2, 15);
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
;SpriteEnemy.c:29: void Update_SPRITE_ENEMY() {
;	---------------------------------
; Function Update_SPRITE_ENEMY
; ---------------------------------
_Update_SPRITE_ENEMY::
	add	sp, #-4
;SpriteEnemy.c:34: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0018
	add	hl,bc
	ld	c,l
	ld	b,h
;SpriteEnemy.c:35: dir_pointer = &dir;
	ld	hl,#_dir_pointer
	ld	(hl),#<(_dir)
	inc	hl
	ld	(hl),#>(_dir)
;SpriteEnemy.c:39: if (TranslateSprite(THIS, 0 << delta_time, data->vy << delta_time)) {
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
;SpriteEnemy.c:41: data->vy = -data->vy;
	ld	a,(bc)
	ldhl	sp,#3
	ld	(hl),a
	xor	a, a
	sub	a, (hl)
	ld	(hl),a
	ld	a,(hl)
	ld	(bc),a
;SpriteEnemy.c:43: PlayFx(CHANNEL_4, 4, 0x0c, 0x41, 0x30, 0xc0);
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
;SpriteEnemy.c:44: if (dir == 0) {
	ld	hl,#_dir + 1
	ld	a,(hl-)
	or	a,(hl)
	jr	NZ,00102$
;SpriteEnemy.c:45: SetSpriteAnim(THIS, anim_walk, 15);
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
;SpriteEnemy.c:46: *dir_pointer = 1;
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
	jr	00105$
00102$:
;SpriteEnemy.c:49: SetSpriteAnim(THIS, anim_walk2, 15);
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
;SpriteEnemy.c:50: *dir_pointer = 0;
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
00105$:
;SpriteEnemy.c:56: SPRITEMANAGER_ITERATE(i, spr) {
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
	ldhl	sp,#0
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	ld	(hl),#0x00
00113$:
	ld	de, #_sprite_manager_updatables + 0
	ld	a,(de)
	ld	c,a
	ldhl	sp,#2
	ld	a,(hl)
	sub	a, c
	jp	Z,00115$
;SpriteEnemy.c:57: if (spr->type == SPRITE_BOMB || spr->type == SPRITE_BOMB_L) {
	pop	de
	push	de
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
;SpriteEnemy.c:58: if (CheckCollision(THIS, spr)) {
	pop	hl
	push	hl
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
;SpriteEnemy.c:59: SpriteManagerRemoveSprite(THIS);
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SpriteManagerRemoveSprite
	add	sp, #2
;SpriteEnemy.c:60: PlayFx(CHANNEL_1, 10, 0x1e, 0x10, 0xf3, 0x00, 0x87);
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
;SpriteEnemy.c:61: SpriteManagerRemoveSprite(spr);
	pop	hl
	push	hl
	push	hl
	call	_SpriteManagerRemoveSprite
	add	sp, #2
00114$:
;SpriteEnemy.c:56: SPRITEMANAGER_ITERATE(i, spr) {
	ldhl	sp,#2
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
	ldhl	sp,#0
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	jp	00113$
00115$:
	add	sp, #4
	ret
;SpriteEnemy.c:68: void Destroy_SPRITE_ENEMY() {
;	---------------------------------
; Function Destroy_SPRITE_ENEMY
; ---------------------------------
_Destroy_SPRITE_ENEMY::
;SpriteEnemy.c:69: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
