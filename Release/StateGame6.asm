;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module StateGame6
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SpriteManagerAdd
	.globl _SpriteManagerLoad
	.globl _InitScrollColor
	.globl _ZInitScrollTilesColor
	.globl _collilision_tiles6
	.globl _bank_STATE_GAME6
	.globl _Start_STATE_GAME6
	.globl _Update_STATE_GAME6
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_GAME6::
	.ds 1
_collilision_tiles6::
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
;StateGame6.c:3: UINT8 bank_STATE_GAME6 = 2;
	ld	hl,#_bank_STATE_GAME6
	ld	(hl),#0x02
;StateGame6.c:14: UINT8 collilision_tiles6[] = { 1,2,3,4,0 };
	ld	hl,#_collilision_tiles6
	ld	(hl),#0x01
	ld	hl,#(_collilision_tiles6 + 0x0001)
	ld	(hl),#0x02
	ld	hl,#(_collilision_tiles6 + 0x0002)
	ld	(hl),#0x03
	ld	hl,#(_collilision_tiles6 + 0x0003)
	ld	(hl),#0x04
	ld	hl,#(_collilision_tiles6 + 0x0004)
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
;StateGame6.c:16: void Start_STATE_GAME6() {
;	---------------------------------
; Function Start_STATE_GAME6
; ---------------------------------
_Start_STATE_GAME6::
;StateGame6.c:19: if(have_diamond == 0 || have_diamond == 3 || have_diamond == 10){
	ld	hl,#_have_diamond + 1
	ld	a,(hl-)
	or	a,(hl)
	jr	Z,00101$
	ld	a,(hl)
	sub	a, #0x03
	jr	NZ,00159$
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	Z,00101$
00159$:
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x0a
	jr	NZ,00102$
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	NZ,00102$
00101$:
;StateGame6.c:20: next_lvl=7;
	ld	hl,#_next_lvl
	ld	(hl),#0x07
	inc	hl
	ld	(hl),#0x00
	jr	00103$
00102$:
;StateGame6.c:23: next_lvl=8;
	ld	hl,#_next_lvl
	ld	(hl),#0x08
	inc	hl
	ld	(hl),#0x00
00103$:
;StateGame6.c:27: NR52_REG = 0x80; //Enables sound, you should always setup this first
	ld	hl,#0xff26
	ld	(hl),#0x80
;StateGame6.c:28: NR51_REG = 0xFF; //Enables all channels (left and right)
	ld	l, #0x25
	ld	(hl),#0xff
;StateGame6.c:29: NR50_REG = 0x77; //Max volume
	ld	l, #0x24
	ld	(hl),#0x77
;StateGame6.c:31: SPRITES_8x16;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;StateGame6.c:32: for(i = 0; i != n_sprite_types; ++ i) {
	ld	b,#0x00
00118$:
	ld	hl,#_n_sprite_types
	ld	a,(hl)
	sub	a, b
	jr	Z,00106$
;StateGame6.c:33: SpriteManagerLoad(i);
	push	bc
	push	bc
	inc	sp
	call	_SpriteManagerLoad
	inc	sp
	pop	bc
;StateGame6.c:32: for(i = 0; i != n_sprite_types; ++ i) {
	inc	b
	jr	00118$
00106$:
;StateGame6.c:35: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateGame6.c:37: have_bomb=2;
	ld	hl,#_have_bomb
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
;StateGame6.c:39: if( have_diamond == 0 ){
	ld	hl,#_have_diamond + 1
	ld	a,(hl-)
	or	a,(hl)
	jp	NZ,00108$
;StateGame6.c:40: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 20, 100);
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
;StateGame6.c:41: door_x = 88;
	ld	hl,#_door_x
	ld	(hl),#0x58
	inc	hl
	ld	(hl),#0x00
;StateGame6.c:42: door_y = 120;
	ld	hl,#_door_y
	ld	(hl),#0x78
	inc	hl
	ld	(hl),#0x00
;StateGame6.c:43: SpriteManagerAdd(SPRITE_KEY, 88, 16);
	ld	hl,#0x0010
	push	hl
	ld	l, #0x58
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:44: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame6.c:46: SpriteManagerAdd(SPRITE_ENEMY, 128, 112);
	ld	hl,#0x0070
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:47: SpriteManagerAdd(SPRITE_ENEMY, 270, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x010e
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:48: SpriteManagerAdd(SPRITE_ENEMY2, 128, 224);
	ld	hl,#0x00e0
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00108$:
;StateGame6.c:51: if( have_diamond == 1 ){
	ld	hl,#_have_diamond
	ld	a,(hl)
	dec	a
	jp	NZ,00110$
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00110$
;StateGame6.c:52: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 20, 16);
	ld	hl,#0x0010
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
;StateGame6.c:53: door_x = 88;
	ld	hl,#_door_x
	ld	(hl),#0x58
	inc	hl
	ld	(hl),#0x00
;StateGame6.c:54: door_y = 16;
	ld	hl,#_door_y
	ld	(hl),#0x10
	inc	hl
	ld	(hl),#0x00
;StateGame6.c:55: SpriteManagerAdd(SPRITE_KEY, 88, 120);
	ld	hl,#0x0078
	push	hl
	ld	l, #0x58
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:56: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame6.c:58: SpriteManagerAdd(SPRITE_ENEMY2, 128, 69);
	ld	hl,#0x0045
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:59: SpriteManagerAdd(SPRITE_ENEMY, 64, 120);
	ld	hl,#0x0078
	push	hl
	ld	l, #0x40
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:60: SpriteManagerAdd(SPRITE_ENEMY, 128, 112);
	ld	hl,#0x0070
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:61: SpriteManagerAdd(SPRITE_ENEMY2, 128, 224);
	ld	hl,#0x00e0
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00110$:
;StateGame6.c:64: if( have_diamond == 3 ){
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x03
	jp	NZ,00112$
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00112$
;StateGame6.c:65: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 20, 120);
	ld	hl,#0x0078
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
;StateGame6.c:66: door_x = 88;
	ld	hl,#_door_x
	ld	(hl),#0x58
	inc	hl
	ld	(hl),#0x00
;StateGame6.c:67: door_y = 16;
	ld	hl,#_door_y
	ld	(hl),#0x10
	inc	hl
	ld	(hl),#0x00
;StateGame6.c:68: SpriteManagerAdd(SPRITE_KEY, 88, 120);
	ld	hl,#0x0078
	push	hl
	ld	l, #0x58
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:69: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame6.c:71: SpriteManagerAdd(SPRITE_ENEMY2, 128, 78);
	ld	hl,#0x004e
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:72: SpriteManagerAdd(SPRITE_ENEMY, 270, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x010e
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:73: SpriteManagerAdd(SPRITE_ENEMY, 70, 120);	
	ld	hl,#0x0078
	push	hl
	ld	l, #0x46
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00112$:
;StateGame6.c:76: if( have_diamond == 6 ){
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x06
	jp	NZ,00114$
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00114$
;StateGame6.c:77: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 72, 16);
	ld	hl,#0x0010
	push	hl
	ld	l, #0x48
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
;StateGame6.c:78: door_x = 88;
	ld	hl,#_door_x
	ld	(hl),#0x58
	inc	hl
	ld	(hl),#0x00
;StateGame6.c:79: door_y = 120;
	ld	hl,#_door_y
	ld	(hl),#0x78
	inc	hl
	ld	(hl),#0x00
;StateGame6.c:80: SpriteManagerAdd(SPRITE_KEY, 20, 44);
	ld	hl,#0x002c
	push	hl
	ld	l, #0x14
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:81: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame6.c:83: SpriteManagerAdd(SPRITE_ENEMY, 128, 112);
	ld	hl,#0x0070
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:84: SpriteManagerAdd(SPRITE_ENEMY, 20, 100);
	ld	hl,#0x0064
	push	hl
	ld	l, #0x14
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:85: SpriteManagerAdd(SPRITE_ENEMY2, 128, 224);	
	ld	hl,#0x00e0
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:86: SpriteManagerAdd(SPRITE_ENEMY2, 128, 69);
	ld	hl,#0x0045
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00114$:
;StateGame6.c:89: if( have_diamond == 10 ){
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x0a
	jp	NZ,00116$
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00116$
;StateGame6.c:90: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 20, 120);
	ld	hl,#0x0078
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
;StateGame6.c:91: door_x = 88;
	ld	hl,#_door_x
	ld	(hl),#0x58
	inc	hl
	ld	(hl),#0x00
;StateGame6.c:92: door_y = 120;
	ld	hl,#_door_y
	ld	(hl),#0x78
	inc	hl
	ld	(hl),#0x00
;StateGame6.c:93: SpriteManagerAdd(SPRITE_KEY, 20, 16);
	ld	hl,#0x0010
	push	hl
	ld	l, #0x14
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:94: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame6.c:95: SpriteManagerAdd(SPRITE_ENEMY, 72, 16);
	ld	hl,#0x0010
	push	hl
	ld	l, #0x48
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:96: SpriteManagerAdd(SPRITE_ENEMY, 128, 112);
	ld	hl,#0x0070
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:97: SpriteManagerAdd(SPRITE_ENEMY, 270, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x010e
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame6.c:98: SpriteManagerAdd(SPRITE_ENEMY, 70, 120);	
	ld	hl,#0x0078
	push	hl
	ld	l, #0x46
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00116$:
;StateGame6.c:101: InitScrollTiles(0, 59, tiles, 3);
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
;StateGame6.c:102: InitScroll(map6Width, map6Height, map6, collilision_tiles6, 0, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	ld	hl,#_collilision_tiles6
	push	hl
	ld	hl,#_map6
	push	hl
	ld	hl,#0x0024
	push	hl
	ld	l, #0x28
	push	hl
	call	_InitScrollColor
	add	sp, #13
;StateGame6.c:103: SHOW_BKG;
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
;StateGame6.c:108: void Update_STATE_GAME6() {
;	---------------------------------
; Function Update_STATE_GAME6
; ---------------------------------
_Update_STATE_GAME6::
;StateGame6.c:110: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
