;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module SpriteEnemy2
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SpriteManagerRemoveSprite
	.globl _PlayFx
	.globl _CheckCollision
	.globl _TranslateSprite
	.globl _SetSpriteAnim
	.globl _bank_SPRITE_ENEMY2
	.globl _anime_right
	.globl _anime_left
	.globl _Start_SPRITE_ENEMY2
	.globl _Update_SPRITE_ENEMY2
	.globl _Destroy_SPRITE_ENEMY2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_ENEMY2::
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
;SpriteEnemy2.c:3: UINT8 bank_SPRITE_ENEMY2 = 2;
	ld	hl,#_bank_SPRITE_ENEMY2
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
;SpriteEnemy2.c:16: void Start_SPRITE_ENEMY2() {
;	---------------------------------
; Function Start_SPRITE_ENEMY2
; ---------------------------------
_Start_SPRITE_ENEMY2::
	add	sp, #-4
;SpriteEnemy2.c:17: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
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
;SpriteEnemy2.c:18: THIS->lim_x=9999;
	ld	hl,#0x0012
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x0f
	ld	(bc),a
	inc	bc
	ld	a,#0x27
	ld	(bc),a
;SpriteEnemy2.c:19: THIS->lim_y=9999;
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
;SpriteEnemy2.c:20: data->vx = 1;
	pop	hl
	push	hl
	ld	(hl),#0x01
;SpriteEnemy2.c:22: SetSpriteAnim(THIS, anime_right, 15);
	ld	a,#0x0f
	push	af
	inc	sp
	ld	hl,#_anime_right
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
_anime_left:
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
_anime_right:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
;SpriteEnemy2.c:26: void Update_SPRITE_ENEMY2() {
;	---------------------------------
; Function Update_SPRITE_ENEMY2
; ---------------------------------
_Update_SPRITE_ENEMY2::
	add	sp, #-4
;SpriteEnemy2.c:29: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0018
	add	hl,bc
	ld	c,l
	ld	b,h
;SpriteEnemy2.c:31: if(TranslateSprite(THIS, data->vx << delta_time,0)) {
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
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	de
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
;SpriteEnemy2.c:33: data->vx = -data->vx;
	ld	a,(bc)
	ldhl	sp,#3
	ld	(hl),a
	xor	a, a
	sub	a, (hl)
	ld	(hl),a
	ld	a,(hl)
	ld	(bc),a
;SpriteEnemy2.c:35: PlayFx(CHANNEL_4, 4, 0x0c, 0x41, 0x30, 0xc0);
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
;SpriteEnemy2.c:36: if (data->vx == -1 ) {
	ld	a,(bc)
	inc	a
	jr	NZ,00102$
;SpriteEnemy2.c:37: SetSpriteAnim(THIS, anime_left, 15);
	ld	a,#0x0f
	push	af
	inc	sp
	ld	hl,#_anime_left
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
;SpriteEnemy2.c:40: SetSpriteAnim(THIS, anime_right, 15);
	ld	a,#0x0f
	push	af
	inc	sp
	ld	hl,#_anime_right
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
00105$:
;SpriteEnemy2.c:46: SPRITEMANAGER_ITERATE(i, spr) {
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
;SpriteEnemy2.c:47: if (spr->type == SPRITE_BOMB || spr->type == SPRITE_BOMB_L) {
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
;SpriteEnemy2.c:48: if (CheckCollision(THIS, spr)) {
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
;SpriteEnemy2.c:49: SpriteManagerRemoveSprite(THIS);
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SpriteManagerRemoveSprite
	add	sp, #2
;SpriteEnemy2.c:50: PlayFx(CHANNEL_1, 10, 0x1e, 0x10, 0xf3, 0x00, 0x87);
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
;SpriteEnemy2.c:51: SpriteManagerRemoveSprite(spr);
	pop	hl
	push	hl
	push	hl
	call	_SpriteManagerRemoveSprite
	add	sp, #2
00114$:
;SpriteEnemy2.c:46: SPRITEMANAGER_ITERATE(i, spr) {
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
;SpriteEnemy2.c:59: void Destroy_SPRITE_ENEMY2() {
;	---------------------------------
; Function Destroy_SPRITE_ENEMY2
; ---------------------------------
_Destroy_SPRITE_ENEMY2::
;SpriteEnemy2.c:60: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
