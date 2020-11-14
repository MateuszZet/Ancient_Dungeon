;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module StateMenu
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SpriteManagerAdd
	.globl _SpriteManagerLoad
	.globl _InitScrollColor
	.globl _ZInitScrollTilesColor
	.globl _SetState
	.globl _collilision_tiles0
	.globl _bank_STATE_MENU
	.globl _Start_STATE_MENU
	.globl _Update_STATE_MENU
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_MENU::
	.ds 1
_collilision_tiles0::
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
;StateMenu.c:3: UINT8 bank_STATE_MENU = 2;
	ld	hl,#_bank_STATE_MENU
	ld	(hl),#0x02
;StateMenu.c:14: UINT8 collilision_tiles0[] = { 1,2,3,4,0 };
	ld	hl,#_collilision_tiles0
	ld	(hl),#0x01
	ld	hl,#(_collilision_tiles0 + 0x0001)
	ld	(hl),#0x02
	ld	hl,#(_collilision_tiles0 + 0x0002)
	ld	(hl),#0x03
	ld	hl,#(_collilision_tiles0 + 0x0003)
	ld	(hl),#0x04
	ld	hl,#(_collilision_tiles0 + 0x0004)
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
;StateMenu.c:16: void Start_STATE_MENU() {
;	---------------------------------
; Function Start_STATE_MENU
; ---------------------------------
_Start_STATE_MENU::
;StateMenu.c:18: next_lvl =1;
	ld	hl,#_next_lvl
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
;StateMenu.c:19: NR52_REG = 0x80; //Enables sound, you should always setup this first
	ld	hl,#0xff26
	ld	(hl),#0x80
;StateMenu.c:20: NR51_REG = 0xFF; //Enables all channels (left and right)
	ld	l, #0x25
	ld	(hl),#0xff
;StateMenu.c:21: NR50_REG = 0x77; //Max volume
	ld	l, #0x24
	ld	(hl),#0x77
;StateMenu.c:23: SPRITES_8x16;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;StateMenu.c:24: for(i = 0; i != n_sprite_types; ++ i) {
	ld	b,#0x00
00103$:
	ld	hl,#_n_sprite_types
	ld	a,(hl)
	sub	a, b
	jr	Z,00101$
;StateMenu.c:25: SpriteManagerLoad(i);
	push	bc
	push	bc
	inc	sp
	call	_SpriteManagerLoad
	inc	sp
	pop	bc
;StateMenu.c:24: for(i = 0; i != n_sprite_types; ++ i) {
	inc	b
	jr	00103$
00101$:
;StateMenu.c:27: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateMenu.c:29: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 70, 35);
	ld	hl,#0x0023
	push	hl
	ld	l, #0x46
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
;StateMenu.c:30: door_x = 20;
	ld	hl,#_door_x
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
;StateMenu.c:31: door_y = 120;
	ld	hl,#_door_y
	ld	(hl),#0x78
	inc	hl
	ld	(hl),#0x00
;StateMenu.c:32: have_bomb = 6;
	ld	hl,#_have_bomb
	ld	(hl),#0x06
	inc	hl
	ld	(hl),#0x00
;StateMenu.c:33: SpriteManagerAdd(SPRITE_KEY, 20, 20);
	ld	hl,#0x0014
	push	hl
	ld	l, #0x14
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:34: SpriteManagerAdd(SPRITE_DOOR,door_x, door_y);
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
;StateMenu.c:35: SpriteManagerAdd(SPRITE_ENEMY, 128, 112);
	ld	hl,#0x0070
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:36: SpriteManagerAdd(SPRITE_ENEMY2, 50, 115 );
	ld	hl,#0x0073
	push	hl
	ld	l, #0x32
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:37: SpriteManagerAdd(SPRITE_ENEMY3, 30, 30);
	ld	hl,#0x001e
	push	hl
	ld	l, #0x1e
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:39: InitScrollTiles(0, 59, tiles, 3);
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
;StateMenu.c:40: InitScroll(menuWidth,menuHeight,menu, collilision_tiles0, 0, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	ld	hl,#_collilision_tiles0
	push	hl
	ld	hl,#_menu
	push	hl
	ld	hl,#0x0012
	push	hl
	ld	l, #0x14
	push	hl
	call	_InitScrollColor
	add	sp, #13
;StateMenu.c:41: SHOW_BKG;
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
;StateMenu.c:46: void Update_STATE_MENU() {
;	---------------------------------
; Function Update_STATE_MENU
; ---------------------------------
_Update_STATE_MENU::
;StateMenu.c:47: if (KEY_PRESSED(J_START)) {
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	7, c
	ret	Z
;StateMenu.c:48: SetState(STATE_GAME3);
	ld	a,#0x03
	push	af
	inc	sp
	call	_SetState
	inc	sp
	ret
	.area _CODE_2
	.area _CABS (ABS)
