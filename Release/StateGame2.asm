;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module StateGame2
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Update_STATE_GAME2
	.globl _Start_STATE_GAME2
	.globl _SpriteManagerAdd
	.globl _SpriteManagerLoad
	.globl _InitScrollColor
	.globl _ZInitScrollTilesColor
	.globl _SetState
	.globl _collilision_tiles2
	.globl _bank_STATE_GAME2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_GAME2::
	.ds 1
_collilision_tiles2::
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
;StateGame2.c:3: UINT8 bank_STATE_GAME2 = 2;
	ld	hl,#_bank_STATE_GAME2
	ld	(hl),#0x02
;StateGame2.c:15: UINT8 collilision_tiles2[] = { 1,2,3,4,0 };
	ld	hl,#_collilision_tiles2
	ld	(hl),#0x01
	ld	hl,#(_collilision_tiles2 + 0x0001)
	ld	(hl),#0x02
	ld	hl,#(_collilision_tiles2 + 0x0002)
	ld	(hl),#0x03
	ld	hl,#(_collilision_tiles2 + 0x0003)
	ld	(hl),#0x04
	ld	hl,#(_collilision_tiles2 + 0x0004)
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
;StateGame2.c:17: void Start_STATE_GAME2() {
;	---------------------------------
; Function Start_STATE_GAME2
; ---------------------------------
_Start_STATE_GAME2::
;StateGame2.c:19: next_lvl=3;
	ld	hl,#_next_lvl
	ld	(hl),#0x03
	inc	hl
	ld	(hl),#0x00
;StateGame2.c:20: NR52_REG = 0x80; //Enables sound, you should always setup this first
	ld	hl,#0xff26
	ld	(hl),#0x80
;StateGame2.c:21: NR51_REG = 0xFF; //Enables all channels (left and right)
	ld	l, #0x25
	ld	(hl),#0xff
;StateGame2.c:22: NR50_REG = 0x77; //Max volume
	ld	l, #0x24
	ld	(hl),#0x77
;StateGame2.c:24: SPRITES_8x16;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;StateGame2.c:25: for(i = 0; i != n_sprite_types; ++ i) {
	ld	b,#0x00
00103$:
	ld	hl,#_n_sprite_types
	ld	a,(hl)
	sub	a, b
	jr	Z,00101$
;StateGame2.c:26: SpriteManagerLoad(i);
	push	bc
	push	bc
	inc	sp
	call	_SpriteManagerLoad
	inc	sp
	pop	bc
;StateGame2.c:25: for(i = 0; i != n_sprite_types; ++ i) {
	inc	b
	jr	00103$
00101$:
;StateGame2.c:28: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateGame2.c:30: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 20, 100);
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
;StateGame2.c:32: door_x = 16;
	ld	hl,#_door_x
	ld	(hl),#0x10
	inc	hl
	ld	(hl),#0x00
;StateGame2.c:33: door_y = 24;
	ld	hl,#_door_y
	ld	(hl),#0x18
	inc	hl
	ld	(hl),#0x00
;StateGame2.c:34: SpriteManagerAdd(SPRITE_KEY, 168, 88);
	ld	hl,#0x0058
	push	hl
	ld	l, #0xa8
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame2.c:35: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame2.c:37: SpriteManagerAdd(SPRITE_ENEMY2, 50, 115 );
	ld	hl,#0x0073
	push	hl
	ld	l, #0x32
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame2.c:38: SpriteManagerAdd(SPRITE_ENEMY2, 24, 64 );
	ld	hl,#0x0040
	push	hl
	ld	l, #0x18
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame2.c:40: SpriteManagerAdd(SPRITE_ENEMY, 88, 104);
	ld	hl,#0x0068
	push	hl
	ld	l, #0x58
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame2.c:41: SpriteManagerAdd(SPRITE_ENEMY, 224, 48);
	ld	hl,#0x0030
	push	hl
	ld	l, #0xe0
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame2.c:42: SpriteManagerAdd(SPRITE_ENEMY, 288, 40);
	ld	hl,#0x0028
	push	hl
	ld	hl,#0x0120
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame2.c:44: InitScrollTiles(0, 59, tiles, 3);
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
;StateGame2.c:45: InitScroll(map2Width, map2Height, map2, collilision_tiles2, 0, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	ld	hl,#_collilision_tiles2
	push	hl
	ld	hl,#_map2
	push	hl
	ld	hl,#0x0012
	push	hl
	ld	l, #0x28
	push	hl
	call	_InitScrollColor
	add	sp, #13
;StateGame2.c:46: SHOW_BKG;
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
;StateGame2.c:51: void Update_STATE_GAME2() {
;	---------------------------------
; Function Update_STATE_GAME2
; ---------------------------------
_Update_STATE_GAME2::
;StateGame2.c:52: if (KEY_PRESSED(J_START)) {
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	7, c
	ret	Z
;StateGame2.c:53: SetState(STATE_GAME3);
	ld	a,#0x03
	push	af
	inc	sp
	call	_SetState
	inc	sp
	ret
	.area _CODE_2
	.area _CABS (ABS)
