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
;StateGame.c:3: UINT8 bank_STATE_GAME = 2;
	ld	hl,#_bank_STATE_GAME
	ld	(hl),#0x02
;StateGame.c:14: UINT8 collilision_tiles[] = {1,0};
	ld	hl,#_collilision_tiles
	ld	(hl),#0x01
	ld	hl,#(_collilision_tiles + 0x0001)
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
;StateGame.c:19: SPRITES_8x16;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateGame.c:20: for(i = 0; i != n_sprite_types; ++ i) {
	ld	b,#0x00
00103$:
	ld	hl,#_n_sprite_types
	ld	a,(hl)
	sub	a, b
	jr	Z,00101$
;StateGame.c:21: SpriteManagerLoad(i);
	push	bc
	push	bc
	inc	sp
	call	_SpriteManagerLoad
	inc	sp
	pop	bc
;StateGame.c:20: for(i = 0; i != n_sprite_types; ++ i) {
	inc	b
	jr	00103$
00101$:
;StateGame.c:23: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateGame.c:24: SpriteManagerAdd(SPRITE_ENEMY, 100, 80);
	ld	hl,#0x0050
	push	hl
	ld	l, #0x64
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame.c:25: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 50, 50);
	ld	hl,#0x0032
	push	hl
	ld	l, #0x32
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
;StateGame.c:27: InitScrollTiles(0, 2, tiles, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_tiles
	push	hl
	ld	hl,#0x0200
	push	hl
	call	_ZInitScrollTilesColor
	add	sp, #7
;StateGame.c:28: InitScroll(mapWidth, mapHeight, map, collilision_tiles, 0, 3);
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
;StateGame.c:29: SHOW_BKG;
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
;StateGame.c:32: void Update_STATE_GAME() {
;	---------------------------------
; Function Update_STATE_GAME
; ---------------------------------
_Update_STATE_GAME::
;StateGame.c:33: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
