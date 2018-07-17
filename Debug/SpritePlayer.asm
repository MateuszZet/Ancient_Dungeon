;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module SpritePlayer
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SetState
	.globl _CheckCollision
	.globl _TranslateSprite
	.globl _SetSpriteAnim
	.globl _bank_SPRITE_PLAYER
	.globl _anim_walk
	.globl _anim_idle
	.globl _Start_SPRITE_PLAYER
	.globl _Update_SPRITE_PLAYER
	.globl _Destroy_SPRITE_PLAYER
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_PLAYER::
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
;SpritePlayer.c:10: UINT8 bank_SPRITE_PLAYER = 2;
	ld	hl,#_bank_SPRITE_PLAYER
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
;SpritePlayer.c:12: void Start_SPRITE_PLAYER() {
;	---------------------------------
; Function Start_SPRITE_PLAYER
; ---------------------------------
_Start_SPRITE_PLAYER::
;SpritePlayer.c:13: THIS->coll_x = 1;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000c
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x01
	ld	(bc),a
;SpritePlayer.c:14: THIS->coll_y = 0;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000d
	add	hl,bc
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;SpritePlayer.c:15: THIS->coll_w = 14;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000e
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x0e
	ld	(bc),a
;SpritePlayer.c:16: THIS->coll_h = 16;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000f
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x10
	ld	(bc),a
	ret
_anim_idle:
	.db #0x01	; 1
	.db #0x00	; 0
_anim_walk:
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
;SpritePlayer.c:19: void Update_SPRITE_PLAYER() {
;	---------------------------------
; Function Update_SPRITE_PLAYER
; ---------------------------------
_Update_SPRITE_PLAYER::
	add	sp, #-3
;SpritePlayer.c:24: if(KEY_PRESSED(J_UP)){
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	2, c
	jp	Z,00102$
;SpritePlayer.c:25: THIS->y--;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0009
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	dec	bc
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;SpritePlayer.c:26: SetSpriteAnim(THIS, anim_walk, 10);
	ld	a,#0x0a
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
;SpritePlayer.c:27: TranslateSprite(THIS, 0, -1);
	ld	hl,#0xff00
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_TranslateSprite
	add	sp, #4
00102$:
;SpritePlayer.c:29: if(KEY_PRESSED(J_DOWN)){
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	3, c
	jp	Z,00104$
;SpritePlayer.c:30: THIS->y++;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0009
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	inc	bc
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;SpritePlayer.c:31: SetSpriteAnim(THIS, anim_walk, 10);
	ld	a,#0x0a
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
;SpritePlayer.c:32: TranslateSprite(THIS, 0, 1);
	ld	hl,#0x0100
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_TranslateSprite
	add	sp, #4
00104$:
;SpritePlayer.c:34: if(KEY_PRESSED(J_RIGHT)){
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	0, c
	jp	Z,00106$
;SpritePlayer.c:35: THIS->x++;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0007
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	inc	bc
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;SpritePlayer.c:36: SetSpriteAnim(THIS, anim_walk, 10);
	ld	a,#0x0a
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
;SpritePlayer.c:37: TranslateSprite(THIS, 1, 0);
	ld	hl,#0x0001
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_TranslateSprite
	add	sp, #4
00106$:
;SpritePlayer.c:39: if(KEY_PRESSED(J_LEFT)){
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	1, c
	jp	Z,00108$
;SpritePlayer.c:40: THIS->x--;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0007
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	dec	bc
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;SpritePlayer.c:41: SetSpriteAnim(THIS, anim_walk, 10);
	ld	a,#0x0a
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
;SpritePlayer.c:42: TranslateSprite(THIS, -1, 0);
	ld	hl,#0x00ff
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_TranslateSprite
	add	sp, #4
00108$:
;SpritePlayer.c:44: if(keys == 0){
	ld	hl,#_keys
	ld	a,(hl)
	or	a, a
	jr	NZ,00110$
;SpritePlayer.c:45: SetSpriteAnim(THIS, anim_idle, 20);
	ld	a,#0x14
	push	af
	inc	sp
	ld	hl,#_anim_idle
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
00110$:
;SpritePlayer.c:49: SPRITEMANAGER_ITERATE(i, spr) {
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
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ldhl	sp,#0
	ld	(hl),#0x00
00117$:
	ld	de, #_sprite_manager_updatables + 0
	ld	a,(de)
	ldhl	sp,#1
	ld	(hl-),a
	ld	a,(hl+)
	sub	a, (hl)
	jp	Z,00119$
;SpritePlayer.c:50: if(spr->type == SPRITE_ENEMY) {
	ld	hl,#0x0010
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#1
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	a
	jr	NZ,00118$
;SpritePlayer.c:51: if(CheckCollision(THIS, spr)) {
	push	bc
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_CheckCollision
	add	sp, #4
	ld	a,e
	or	a, a
	jr	Z,00118$
;SpritePlayer.c:52: SetState(STATE_GAME);
	xor	a, a
	push	af
	inc	sp
	call	_SetState
	inc	sp
00118$:
;SpritePlayer.c:49: SPRITEMANAGER_ITERATE(i, spr) {
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
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	jp	00117$
00119$:
	add	sp, #3
	ret
;SpritePlayer.c:58: void Destroy_SPRITE_PLAYER() {
;	---------------------------------
; Function Destroy_SPRITE_PLAYER
; ---------------------------------
_Destroy_SPRITE_PLAYER::
;SpritePlayer.c:59: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
