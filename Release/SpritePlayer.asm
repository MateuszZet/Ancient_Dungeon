;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module SpritePlayer
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PlayFx
	.globl _SpriteManagerRemoveSprite
	.globl _SpriteManagerRemove
	.globl _SpriteManagerAdd
	.globl _SetState
	.globl _CheckCollision
	.globl _TranslateSprite
	.globl _SetSpriteAnim
	.globl _direction_x
	.globl _have_bomb
	.globl _next_lvl
	.globl _door_y
	.globl _door_x
	.globl _bank_SPRITE_PLAYER
	.globl _anim_up
	.globl _anim_left
	.globl _anim_right
	.globl _anim_down
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
_door_x::
	.ds 2
_door_y::
	.ds 2
_next_lvl::
	.ds 2
_have_bomb::
	.ds 2
_direction_x::
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
;SpritePlayer.c:14: UINT8 bank_SPRITE_PLAYER = 2;
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
;SpritePlayer.c:22: void Start_SPRITE_PLAYER() {
;	---------------------------------
; Function Start_SPRITE_PLAYER
; ---------------------------------
_Start_SPRITE_PLAYER::
;SpritePlayer.c:23: THIS->coll_x = 1;
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
;SpritePlayer.c:24: THIS->coll_y = 0;
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
;SpritePlayer.c:25: THIS->coll_w = 13;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000e
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x0d
	ld	(bc),a
;SpritePlayer.c:26: THIS->coll_h = 16;
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
_anim_down:
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
_anim_right:
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
_anim_left:
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x06	; 6
_anim_up:
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x08	; 8
;SpritePlayer.c:29: void Update_SPRITE_PLAYER() {
;	---------------------------------
; Function Update_SPRITE_PLAYER
; ---------------------------------
_Update_SPRITE_PLAYER::
	add	sp, #-5
;SpritePlayer.c:34: if(KEY_PRESSED(J_UP)){
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	2, c
	jp	Z,00102$
;SpritePlayer.c:35: THIS->y--;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0009
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
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
;SpritePlayer.c:36: SetSpriteAnim(THIS, anim_up, 10);
	ld	a,#0x0a
	push	af
	inc	sp
	ld	hl,#_anim_up
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
;SpritePlayer.c:37: TranslateSprite(THIS, 0, -1 << delta_time);
	ld	hl,#_delta_time
	ld	a,(hl)
	push	af
	ld	b,#0xff
	pop	af
	inc	a
	jr	00252$
00251$:
	sla	b
00252$:
	dec	a
	jr	NZ,00251$
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
00102$:
;SpritePlayer.c:39: if(KEY_PRESSED(J_DOWN)){
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	3, c
	jp	Z,00104$
;SpritePlayer.c:40: THIS->y++;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0009
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
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
;SpritePlayer.c:41: SetSpriteAnim(THIS, anim_down, 10);
	ld	a,#0x0a
	push	af
	inc	sp
	ld	hl,#_anim_down
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
;SpritePlayer.c:42: TranslateSprite(THIS, 0, 1 << delta_time);
	ld	hl,#_delta_time
	ld	a,(hl)
	push	af
	ld	b,#0x01
	pop	af
	inc	a
	jr	00255$
00254$:
	sla	b
00255$:
	dec	a
	jr	NZ,00254$
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
00104$:
;SpritePlayer.c:44: if(KEY_PRESSED(J_RIGHT)){
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	0, c
	jp	Z,00106$
;SpritePlayer.c:45: THIS->x++;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0007
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
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
;SpritePlayer.c:46: SetSpriteAnim(THIS, anim_right, 10);
	ld	a,#0x0a
	push	af
	inc	sp
	ld	hl,#_anim_right
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
;SpritePlayer.c:47: TranslateSprite(THIS, 1 << delta_time, 0);
	ld	hl,#_delta_time
	ld	a,(hl)
	push	af
	ld	b,#0x01
	pop	af
	inc	a
	jr	00258$
00257$:
	sla	b
00258$:
	dec	a
	jr	NZ,00257$
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
;SpritePlayer.c:48: direction_x = 1;
	ld	hl,#_direction_x
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
00106$:
;SpritePlayer.c:51: if(KEY_PRESSED(J_LEFT)){
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	1, c
	jp	Z,00108$
;SpritePlayer.c:52: THIS->x--;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0007
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
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
;SpritePlayer.c:53: SetSpriteAnim(THIS, anim_left, 10);
	ld	a,#0x0a
	push	af
	inc	sp
	ld	hl,#_anim_left
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
;SpritePlayer.c:54: TranslateSprite(THIS, -1 << delta_time, 0);
	ld	hl,#_delta_time
	ld	a,(hl)
	push	af
	ld	b,#0xff
	pop	af
	inc	a
	jr	00261$
00260$:
	sla	b
00261$:
	dec	a
	jr	NZ,00260$
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
;SpritePlayer.c:55: direction_x = 0;
	ld	hl,#_direction_x
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
00108$:
;SpritePlayer.c:58: if(keys == 0){
	ld	hl,#_keys
	ld	a,(hl)
	or	a, a
	jr	NZ,00110$
;SpritePlayer.c:59: SetSpriteAnim(THIS, anim_idle, 20);
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
;SpritePlayer.c:61: if (KEY_TICKED(J_A) && have_bomb>0 ) {
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	4, c
	jp	Z,00112$
	ld	hl,#_previous_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	4, c
	jp	NZ,00112$
	ld	hl,#_have_bomb
	ld	a,#0x00
	sub	a, (hl)
	inc	hl
	ld	a,#0x00
	sbc	a, (hl)
	ld	a,#0x00
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z,00265$
	bit	7, d
	jr	NZ,00266$
	cp	a, a
	jr	00266$
00265$:
	bit	7, d
	jr	Z,00266$
	scf
00266$:
	jp	NC,00112$
;SpritePlayer.c:35: THIS->y--;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;SpritePlayer.c:62: SpriteManagerAdd(SPRITE_BOMB, THIS->x + 15, THIS->y);
	ld	hl,#0x0009
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ld	hl,#0x0007
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
	ld	hl,#0x000f
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#3
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	ld	a,#0x06
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;SpritePlayer.c:63: have_bomb--;
	ld	hl,#_have_bomb + 1
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;SpritePlayer.c:64: PlayFx(CHANNEL_1, 10, 0x38, 0x70, 0xe0, 0x0a, 0xc6);
	ld	hl,#0x00c6
	push	hl
	ld	l, #0x0a
	push	hl
	ld	l, #0xe0
	push	hl
	ld	l, #0x70
	push	hl
	ld	l, #0x38
	push	hl
	ld	hl,#0x0a00
	push	hl
	call	_PlayFx
	add	sp, #12
00112$:
;SpritePlayer.c:67: if (KEY_TICKED(J_B) && have_bomb>0) {
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	5, c
	jp	Z,00116$
	ld	hl,#_previous_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	5, c
	jp	NZ,00116$
	ld	hl,#_have_bomb
	ld	a,#0x00
	sub	a, (hl)
	inc	hl
	ld	a,#0x00
	sbc	a, (hl)
	ld	a,#0x00
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z,00270$
	bit	7, d
	jr	NZ,00271$
	cp	a, a
	jr	00271$
00270$:
	bit	7, d
	jr	Z,00271$
	scf
00271$:
	jp	NC,00116$
;SpritePlayer.c:35: THIS->y--;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;SpritePlayer.c:68: SpriteManagerAdd(SPRITE_BOMB_L, THIS->x - 20, THIS->y);
	ld	hl,#0x0009
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ld	hl,#0x0007
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
	ld	a,c
	add	a,#0xec
	ld	c,a
	ld	a,b
	adc	a,#0xff
	ld	b,a
	ldhl	sp,#3
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	ld	a,#0x07
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;SpritePlayer.c:69: have_bomb--;
	ld	hl,#_have_bomb + 1
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;SpritePlayer.c:70: PlayFx(CHANNEL_1, 10, 0x38, 0x70, 0xe0, 0x0a, 0xc6);
	ld	hl,#0x00c6
	push	hl
	ld	l, #0x0a
	push	hl
	ld	l, #0xe0
	push	hl
	ld	l, #0x70
	push	hl
	ld	l, #0x38
	push	hl
	ld	hl,#0x0a00
	push	hl
	call	_PlayFx
	add	sp, #12
00116$:
;SpritePlayer.c:76: SPRITEMANAGER_ITERATE(i, spr) {
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
00145$:
	ld	de, #_sprite_manager_updatables + 0
	ld	a,(de)
	ld	c,a
	ldhl	sp,#2
	ld	a,(hl)
	sub	a, c
	jp	Z,00147$
;SpritePlayer.c:77: if(spr->type == SPRITE_ENEMY) {
	pop	de
	push	de
	ld	hl,#0x0010
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	dec	a
	jp	NZ,00122$
;SpritePlayer.c:78: if(CheckCollision(THIS, spr)) {
	push	bc
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_CheckCollision
	add	sp, #4
	pop	bc
	ld	a,e
	or	a, a
	jr	Z,00122$
;SpritePlayer.c:79: SetState(STATE_MENU);
	push	bc
	xor	a, a
	push	af
	inc	sp
	call	_SetState
	inc	sp
	pop	bc
;SpritePlayer.c:80: PlayFx(CHANNEL_1, 10, 0x4f, 0xc7, 0xf3, 0x73, 0x86);
	push	bc
	ld	hl,#0x0086
	push	hl
	ld	l, #0x73
	push	hl
	ld	l, #0xf3
	push	hl
	ld	l, #0xc7
	push	hl
	ld	l, #0x4f
	push	hl
	ld	hl,#0x0a00
	push	hl
	call	_PlayFx
	add	sp, #12
	pop	bc
00122$:
;SpritePlayer.c:84: if(spr->type == SPRITE_ENEMY2) {
	ld	a,(bc)
	sub	a, #0x02
	jp	NZ,00126$
;SpritePlayer.c:85: if(CheckCollision(THIS, spr)) {
	push	bc
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_CheckCollision
	add	sp, #4
	pop	bc
	ld	a,e
	or	a, a
	jr	Z,00126$
;SpritePlayer.c:86: SetState(STATE_MENU);
	push	bc
	xor	a, a
	push	af
	inc	sp
	call	_SetState
	inc	sp
	pop	bc
;SpritePlayer.c:87: PlayFx(CHANNEL_1, 10, 0x4f, 0xc7, 0xf3, 0x73, 0x86);
	push	bc
	ld	hl,#0x0086
	push	hl
	ld	l, #0x73
	push	hl
	ld	l, #0xf3
	push	hl
	ld	l, #0xc7
	push	hl
	ld	l, #0x4f
	push	hl
	ld	hl,#0x0a00
	push	hl
	call	_PlayFx
	add	sp, #12
	pop	bc
00126$:
;SpritePlayer.c:90: if (spr->type == SPRITE_BOMB) {
	ld	a,(bc)
	sub	a, #0x06
	jp	NZ,00130$
;SpritePlayer.c:91: if (CheckCollision(THIS, spr)) {
	push	bc
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_CheckCollision
	add	sp, #4
	pop	bc
	ld	a,e
	or	a, a
	jr	Z,00130$
;SpritePlayer.c:92: SetState(STATE_MENU);
	push	bc
	xor	a, a
	push	af
	inc	sp
	call	_SetState
	inc	sp
	pop	bc
;SpritePlayer.c:93: PlayFx(CHANNEL_1, 10, 0x4f, 0xc7, 0xf3, 0x73, 0x86);
	push	bc
	ld	hl,#0x0086
	push	hl
	ld	l, #0x73
	push	hl
	ld	l, #0xf3
	push	hl
	ld	l, #0xc7
	push	hl
	ld	l, #0x4f
	push	hl
	ld	hl,#0x0a00
	push	hl
	call	_PlayFx
	add	sp, #12
	pop	bc
00130$:
;SpritePlayer.c:96: if (spr->type == SPRITE_BOMB_L) {
	ld	a,(bc)
	sub	a, #0x07
	jp	NZ,00134$
;SpritePlayer.c:97: if (CheckCollision(THIS, spr)) {
	push	bc
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_CheckCollision
	add	sp, #4
	pop	bc
	ld	a,e
	or	a, a
	jr	Z,00134$
;SpritePlayer.c:98: SetState(STATE_MENU);
	push	bc
	xor	a, a
	push	af
	inc	sp
	call	_SetState
	inc	sp
	pop	bc
;SpritePlayer.c:99: PlayFx(CHANNEL_1, 10, 0x4f, 0xc7, 0xf3, 0x73, 0x86);
	push	bc
	ld	hl,#0x0086
	push	hl
	ld	l, #0x73
	push	hl
	ld	l, #0xf3
	push	hl
	ld	l, #0xc7
	push	hl
	ld	l, #0x4f
	push	hl
	ld	hl,#0x0a00
	push	hl
	call	_PlayFx
	add	sp, #12
	pop	bc
00134$:
;SpritePlayer.c:102: if (spr->type == SPRITE_KEY) {
	ld	a,(bc)
	sub	a, #0x03
	jp	NZ,00138$
;SpritePlayer.c:103: if (CheckCollision(THIS, spr)) {
	push	bc
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_CheckCollision
	add	sp, #4
	pop	bc
	ld	a,e
	or	a, a
	jp	Z,00138$
;SpritePlayer.c:104: SpriteManagerRemoveSprite(spr);
	push	bc
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	call	_SpriteManagerRemoveSprite
	add	sp, #2
	pop	bc
;SpritePlayer.c:105: SpriteManagerRemove(2); //need to place door always as 2 sprite
	push	bc
	ld	hl,#0x0002
	push	hl
	call	_SpriteManagerRemove
	add	sp, #2
	pop	bc
;SpritePlayer.c:106: SpriteManagerAdd(SPRITE_DOOROPEN, door_x, door_y);
	push	bc
	ld	hl,#_door_y
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#_door_x
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x05
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
	pop	bc
;SpritePlayer.c:107: PlayFx(CHANNEL_1, 10, 0x4U, 0xFEU, 0xA1U, 0x8FU, 0x86U);
	push	bc
	ld	hl,#0x0086
	push	hl
	ld	l, #0x8f
	push	hl
	ld	l, #0xa1
	push	hl
	ld	l, #0xfe
	push	hl
	ld	l, #0x04
	push	hl
	ld	hl,#0x0a00
	push	hl
	call	_PlayFx
	add	sp, #12
	pop	bc
00138$:
;SpritePlayer.c:110: if (spr->type == SPRITE_DOOROPEN) {
	ld	a,(bc)
	sub	a, #0x05
	jr	NZ,00146$
;SpritePlayer.c:111: if (CheckCollision(THIS, spr)) {
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
	jr	Z,00146$
;SpritePlayer.c:112: SetState(next_lvl);
	ld	hl,#_next_lvl
	ld	b,(hl)
	push	bc
	inc	sp
	call	_SetState
	inc	sp
00146$:
;SpritePlayer.c:76: SPRITEMANAGER_ITERATE(i, spr) {
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
	jp	00145$
00147$:
	add	sp, #5
	ret
;SpritePlayer.c:118: void Destroy_SPRITE_PLAYER() {
;	---------------------------------
; Function Destroy_SPRITE_PLAYER
; ---------------------------------
_Destroy_SPRITE_PLAYER::
;SpritePlayer.c:119: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
