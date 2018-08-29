;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module StateGame3
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Update_STATE_GAME3
	.globl _Start_STATE_GAME3
	.globl _SpriteManagerAdd
	.globl _SpriteManagerLoad
	.globl _InitScrollColor
	.globl _ZInitScrollTilesColor
	.globl _SetState
	.globl _collilision_tiles3
	.globl _bank_STATE_GAME3
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_GAME3::
	.ds 1
_collilision_tiles3::
	.ds 5
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
;StateGame3.c:3: UINT8 bank_STATE_GAME3 = 2;
	ld	hl,#_bank_STATE_GAME3
	ld	(hl),#0x02
;StateGame3.c:15: UINT8 collilision_tiles3[] = { 1,2,3,4,0 };
	ld	hl,#_collilision_tiles3
	ld	(hl),#0x01
	ld	hl,#(_collilision_tiles3 + 0x0001)
	ld	(hl),#0x02
	ld	hl,#(_collilision_tiles3 + 0x0002)
	ld	(hl),#0x03
	ld	hl,#(_collilision_tiles3 + 0x0003)
	ld	(hl),#0x04
	ld	hl,#(_collilision_tiles3 + 0x0004)
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
;StateGame3.c:17: void Start_STATE_GAME3() {
;	---------------------------------
; Function Start_STATE_GAME3
; ---------------------------------
_Start_STATE_GAME3::
;StateGame3.c:19: next_lvl=4;
	ld	hl,#_next_lvl
	ld	(hl),#0x04
	inc	hl
	ld	(hl),#0x00
;StateGame3.c:20: NR52_REG = 0x80; //Enables sound, you should always setup this first
	ld	hl,#0xff26
	ld	(hl),#0x80
;StateGame3.c:21: NR51_REG = 0xFF; //Enables all channels (left and right)
	ld	l, #0x25
	ld	(hl),#0xff
;StateGame3.c:22: NR50_REG = 0x77; //Max volume
	ld	l, #0x24
	ld	(hl),#0x77
;StateGame3.c:24: SPRITES_8x16;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;StateGame3.c:25: for(i = 0; i != n_sprite_types; ++ i) {
	ld	b,#0x00
00103$:
	ld	hl,#_n_sprite_types
	ld	a,(hl)
	sub	a, b
	jr	Z,00101$
;StateGame3.c:26: SpriteManagerLoad(i);
	push	bc
	push	bc
	inc	sp
	call	_SpriteManagerLoad
	inc	sp
	pop	bc
;StateGame3.c:25: for(i = 0; i != n_sprite_types; ++ i) {
	inc	b
	jr	00103$
00101$:
;StateGame3.c:28: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateGame3.c:30: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 24, 24);
	ld	hl,#0x0018
	push	hl
	ld	l, #0x18
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
	ld	hl,#_scroll_target
	ld	(hl),e
	inc	hl
	ld	(hl),d
;StateGame3.c:32: door_x = 104;
	ld	hl,#_door_x
	ld	(hl),#0x68
	inc	hl
	ld	(hl),#0x00
;StateGame3.c:33: door_y = 344;
	ld	hl,#_door_y
	ld	(hl),#0x58
	inc	hl
	ld	(hl),#0x01
;StateGame3.c:34: SpriteManagerAdd(SPRITE_KEY, 120, 408);
	ld	hl,#0x0198
	push	hl
	ld	hl,#0x0078
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame3.c:35: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
	ld	a,#0x04
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame3.c:37: SpriteManagerAdd(SPRITE_ENEMY2, 16, 312 );
	ld	hl,#0x0138
	push	hl
	ld	hl,#0x0010
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame3.c:38: SpriteManagerAdd(SPRITE_ENEMY2, 16, 88 );
	ld	hl,#0x0058
	push	hl
	ld	l, #0x10
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame3.c:39: SpriteManagerAdd(SPRITE_ENEMY2, 32, 408 );
	ld	hl,#0x0198
	push	hl
	ld	hl,#0x0020
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame3.c:41: SpriteManagerAdd(SPRITE_ENEMY, 120, 24);
	ld	hl,#0x0018
	push	hl
	ld	l, #0x78
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame3.c:42: SpriteManagerAdd(SPRITE_ENEMY, 120, 216);
	ld	hl,#0x00d8
	push	hl
	ld	l, #0x78
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame3.c:43: SpriteManagerAdd(SPRITE_ENEMY, 32, 400);
	ld	hl,#0x0190
	push	hl
	ld	hl,#0x0020
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame3.c:46: InitScrollTiles(0, 59, tiles, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_tiles
	push	hl
	ld	hl,#0x3b00
	push	hl
	call	_ZInitScrollTilesColor
	add	sp, #7
;StateGame3.c:47: InitScroll(map3Width, map3Height, map3, collilision_tiles3, 0, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	ld	hl,#_collilision_tiles3
	push	hl
	ld	hl,#_map3
	push	hl
	ld	hl,#0x0038
	push	hl
	ld	l, #0x14
	push	hl
	call	_InitScrollColor
	add	sp, #13
;StateGame3.c:48: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
	ret
;StateGame3.c:53: void Update_STATE_GAME3() {
;	---------------------------------
; Function Update_STATE_GAME3
; ---------------------------------
_Update_STATE_GAME3::
;StateGame3.c:54: if (KEY_PRESSED(J_START)) {
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	7, c
	ret	Z
;StateGame3.c:55: SetState(STATE_GAME4);
	ld	a,#0x04
	push	af
	inc	sp
	call	_SetState
	inc	sp
	ret
	.area _CODE_2
	.area _CABS (ABS)
