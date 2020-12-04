;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module StateGame
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SpriteManagerAdd
	.globl _SpriteManagerLoad
	.globl _InitScrollColor
	.globl _ZInitScrollTilesColor
	.globl _collilision_tiles
	.globl _bank_STATE_GAME
	.globl _Start_STATE_GAME
	.globl _Update_STATE_GAME
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_GAME::
	.ds 1
_collilision_tiles::
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
;StateGame.c:3: UINT8 bank_STATE_GAME = 2;
	ld	hl,#_bank_STATE_GAME
	ld	(hl),#0x02
;StateGame.c:14: UINT8 collilision_tiles[] = { 1,2,3,4,0 };
	ld	hl,#_collilision_tiles
	ld	(hl),#0x01
	ld	hl,#(_collilision_tiles + 0x0001)
	ld	(hl),#0x02
	ld	hl,#(_collilision_tiles + 0x0002)
	ld	(hl),#0x03
	ld	hl,#(_collilision_tiles + 0x0003)
	ld	(hl),#0x04
	ld	hl,#(_collilision_tiles + 0x0004)
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
;StateGame.c:16: void Start_STATE_GAME() {
;	---------------------------------
; Function Start_STATE_GAME
; ---------------------------------
_Start_STATE_GAME::
;StateGame.c:18: next_lvl=2;
	ld	hl,#_next_lvl
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
;StateGame.c:19: NR52_REG = 0x80; //Enables sound, you should always setup this first
	ld	hl,#0xff26
	ld	(hl),#0x80
;StateGame.c:20: NR51_REG = 0xFF; //Enables all channels (left and right)
	ld	l, #0x25
	ld	(hl),#0xff
;StateGame.c:21: NR50_REG = 0x77; //Max volume
	ld	l, #0x24
	ld	(hl),#0x77
;StateGame.c:23: SPRITES_8x16;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;StateGame.c:24: for(i = 0; i != n_sprite_types; ++ i) {
	ld	b,#0x00
00113$:
	ld	hl,#_n_sprite_types
	ld	a,(hl)
	sub	a, b
	jr	Z,00101$
;StateGame.c:25: SpriteManagerLoad(i);
	push	bc
	push	bc
	inc	sp
	call	_SpriteManagerLoad
	inc	sp
	pop	bc
;StateGame.c:24: for(i = 0; i != n_sprite_types; ++ i) {
	inc	b
	jr	00113$
00101$:
;StateGame.c:27: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateGame.c:29: have_bomb=2;
	ld	hl,#_have_bomb
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
;StateGame.c:31: if( have_diamond == 0 ){
	ld	hl,#_have_diamond + 1
	ld	a,(hl-)
	or	a,(hl)
	jp	NZ,00103$
;StateGame.c:33: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 20, 100);
	ld	hl,#0x0064
	push	hl
	ld	l, #0x14
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
;StateGame.c:35: door_x = 240;
	ld	hl,#_door_x
	ld	(hl),#0xf0
	inc	hl
	ld	(hl),#0x00
;StateGame.c:36: door_y = 112;
	ld	hl,#_door_y
	ld	(hl),#0x70
	inc	hl
	ld	(hl),#0x00
;StateGame.c:38: SpriteManagerAdd(SPRITE_KEY, 288, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x0120
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:39: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame.c:41: SpriteManagerAdd(SPRITE_ENEMY, 40, 32);
	ld	hl,#0x0020
	push	hl
	ld	l, #0x28
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:42: SpriteManagerAdd(SPRITE_ENEMY, 128, 80);
	ld	hl,#0x0050
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:43: SpriteManagerAdd(SPRITE_ENEMY, 200, 112);
	ld	hl,#0x0070
	push	hl
	ld	l, #0xc8
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:44: SpriteManagerAdd(SPRITE_ENEMY, 288, 96);
	ld	hl,#0x0060
	push	hl
	ld	hl,#0x0120
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:45: SpriteManagerAdd(SPRITE_ENEMY3, 30, 30);	
	ld	hl,#0x001e
	push	hl
	ld	l, #0x1e
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00103$:
;StateGame.c:48: if( have_diamond == 1 ){
	ld	hl,#_have_diamond
	ld	a,(hl)
	dec	a
	jp	NZ,00105$
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00105$
;StateGame.c:50: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 288, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x0120
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
;StateGame.c:52: door_x = 20;
	ld	hl,#_door_x
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
;StateGame.c:53: door_y = 100;
	ld	hl,#_door_y
	ld	(hl),#0x64
	inc	hl
	ld	(hl),#0x00
;StateGame.c:55: SpriteManagerAdd(SPRITE_KEY, 24, 24);
	ld	hl,#0x0018
	push	hl
	ld	l, #0x18
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:56: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame.c:58: SpriteManagerAdd(SPRITE_ENEMY3, 30, 30);
	ld	hl,#0x001e
	push	hl
	ld	l, #0x1e
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:59: SpriteManagerAdd(SPRITE_ENEMY, 40, 32);
	ld	hl,#0x0020
	push	hl
	ld	l, #0x28
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:60: SpriteManagerAdd(SPRITE_ENEMY, 208, 112);
	ld	hl,#0x0070
	push	hl
	ld	l, #0xd0
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:61: SpriteManagerAdd(SPRITE_ENEMY2, 208, 56);
	ld	hl,#0x0038
	push	hl
	ld	l, #0xd0
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00105$:
;StateGame.c:64: if( have_diamond == 3 ){
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x03
	jp	NZ,00107$
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00107$
;StateGame.c:66: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 240, 112);
	ld	hl,#0x0070
	push	hl
	ld	l, #0xf0
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
;StateGame.c:68: door_x = 288;
	ld	hl,#_door_x
	ld	(hl),#0x20
	inc	hl
	ld	(hl),#0x01
;StateGame.c:69: door_y = 112;
	ld	hl,#_door_y
	ld	(hl),#0x70
	inc	hl
	ld	(hl),#0x00
;StateGame.c:71: SpriteManagerAdd(SPRITE_KEY, 20, 100);
	ld	hl,#0x0064
	push	hl
	ld	l, #0x14
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:72: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame.c:74: SpriteManagerAdd(SPRITE_ENEMY, 40, 32);
	ld	hl,#0x0020
	push	hl
	ld	l, #0x28
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:75: SpriteManagerAdd(SPRITE_ENEMY, 155, 80);
	ld	hl,#0x0050
	push	hl
	ld	l, #0x9b
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:76: SpriteManagerAdd(SPRITE_ENEMY2, 208, 38);
	ld	hl,#0x0026
	push	hl
	ld	l, #0xd0
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:77: SpriteManagerAdd(SPRITE_ENEMY3, 288, 96);
	ld	hl,#0x0060
	push	hl
	ld	hl,#0x0120
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00107$:
;StateGame.c:81: if( have_diamond == 6 ){
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x06
	jp	NZ,00109$
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00109$
;StateGame.c:83: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 135, 120);
	ld	hl,#0x0078
	push	hl
	ld	l, #0x87
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
;StateGame.c:85: door_x = 20;
	ld	hl,#_door_x
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
;StateGame.c:86: door_y = 112;
	ld	hl,#_door_y
	ld	(hl),#0x70
	inc	hl
	ld	(hl),#0x00
;StateGame.c:88: SpriteManagerAdd(SPRITE_KEY, 288, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x0120
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:89: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame.c:91: SpriteManagerAdd(SPRITE_ENEMY, 40, 32);
	ld	hl,#0x0020
	push	hl
	ld	l, #0x28
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:92: SpriteManagerAdd(SPRITE_ENEMY, 90, 80);
	ld	hl,#0x0050
	push	hl
	ld	l, #0x5a
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:93: SpriteManagerAdd(SPRITE_ENEMY, 180, 112);
	ld	hl,#0x0070
	push	hl
	ld	l, #0xb4
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:94: SpriteManagerAdd(SPRITE_ENEMY, 288, 96);
	ld	hl,#0x0060
	push	hl
	ld	hl,#0x0120
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:95: SpriteManagerAdd(SPRITE_ENEMY2, 40, 30);	
	ld	hl,#0x001e
	push	hl
	ld	l, #0x28
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00109$:
;StateGame.c:98: if( have_diamond == 10 ){
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x0a
	jp	NZ,00111$
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00111$
;StateGame.c:100: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 20, 100);
	ld	hl,#0x0064
	push	hl
	ld	l, #0x14
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
;StateGame.c:102: door_x = 24;
	ld	hl,#_door_x
	ld	(hl),#0x18
	inc	hl
	ld	(hl),#0x00
;StateGame.c:103: door_y = 24;
	ld	hl,#_door_y
	ld	(hl),#0x18
	inc	hl
	ld	(hl),#0x00
;StateGame.c:105: SpriteManagerAdd(SPRITE_KEY, 288, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x0120
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:106: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame.c:108: SpriteManagerAdd(SPRITE_ENEMY, 40, 32);
	ld	hl,#0x0020
	push	hl
	ld	l, #0x28
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:109: SpriteManagerAdd(SPRITE_ENEMY, 90, 80);
	ld	hl,#0x0050
	push	hl
	ld	l, #0x5a
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:110: SpriteManagerAdd(SPRITE_ENEMY, 180, 112);
	ld	hl,#0x0070
	push	hl
	ld	l, #0xb4
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:111: SpriteManagerAdd(SPRITE_ENEMY, 288, 96);
	ld	hl,#0x0060
	push	hl
	ld	hl,#0x0120
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:112: SpriteManagerAdd(SPRITE_ENEMY2, 40, 30);
	ld	hl,#0x001e
	push	hl
	ld	l, #0x28
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:113: SpriteManagerAdd(SPRITE_ENEMY3, 288, 96);
	ld	hl,#0x0060
	push	hl
	ld	hl,#0x0120
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00111$:
;StateGame.c:116: InitScrollTiles(0, 59, tiles, 3);
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
;StateGame.c:117: InitScroll(mapWidth, mapHeight, map, collilision_tiles, 0, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	ld	hl,#_collilision_tiles
	push	hl
	ld	hl,#_map
	push	hl
	ld	hl,#0x0012
	push	hl
	ld	l, #0x28
	push	hl
	call	_InitScrollColor
	add	sp, #13
;StateGame.c:118: SHOW_BKG;
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
;StateGame.c:121: void Update_STATE_GAME() {
;	---------------------------------
; Function Update_STATE_GAME
; ---------------------------------
_Update_STATE_GAME::
;StateGame.c:124: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
