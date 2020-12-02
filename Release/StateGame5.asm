;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module StateGame5
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SpriteManagerAdd
	.globl _SpriteManagerLoad
	.globl _InitScrollColor
	.globl _ZInitScrollTilesColor
	.globl _SetState
	.globl _collilision_tiles5
	.globl _bank_STATE_GAME5
	.globl _Start_STATE_GAME5
	.globl _Update_STATE_GAME5
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_GAME5::
	.ds 1
_collilision_tiles5::
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
;StateGame5.c:3: UINT8 bank_STATE_GAME5 = 2;
	ld	hl,#_bank_STATE_GAME5
	ld	(hl),#0x02
;StateGame5.c:14: UINT8 collilision_tiles5[] = { 1,2,3,4,0 };
	ld	hl,#_collilision_tiles5
	ld	(hl),#0x01
	ld	hl,#(_collilision_tiles5 + 0x0001)
	ld	(hl),#0x02
	ld	hl,#(_collilision_tiles5 + 0x0002)
	ld	(hl),#0x03
	ld	hl,#(_collilision_tiles5 + 0x0003)
	ld	(hl),#0x04
	ld	hl,#(_collilision_tiles5 + 0x0004)
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
;StateGame5.c:16: void Start_STATE_GAME5() {
;	---------------------------------
; Function Start_STATE_GAME5
; ---------------------------------
_Start_STATE_GAME5::
;StateGame5.c:18: next_lvl=6;
	ld	hl,#_next_lvl
	ld	(hl),#0x06
	inc	hl
	ld	(hl),#0x00
;StateGame5.c:19: NR52_REG = 0x80; //Enables sound, you should always setup this first
	ld	hl,#0xff26
	ld	(hl),#0x80
;StateGame5.c:20: NR51_REG = 0xFF; //Enables all channels (left and right)
	ld	l, #0x25
	ld	(hl),#0xff
;StateGame5.c:21: NR50_REG = 0x77; //Max volume
	ld	l, #0x24
	ld	(hl),#0x77
;StateGame5.c:23: SPRITES_8x16;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;StateGame5.c:24: for(i = 0; i != n_sprite_types; ++ i) {
	ld	b,#0x00
00105$:
	ld	hl,#_n_sprite_types
	ld	a,(hl)
	sub	a, b
	jr	Z,00101$
;StateGame5.c:25: SpriteManagerLoad(i);
	push	bc
	push	bc
	inc	sp
	call	_SpriteManagerLoad
	inc	sp
	pop	bc
;StateGame5.c:24: for(i = 0; i != n_sprite_types; ++ i) {
	inc	b
	jr	00105$
00101$:
;StateGame5.c:27: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateGame5.c:29: have_bomb=2;
	ld	hl,#_have_bomb
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
;StateGame5.c:31: if( have_diamond == 0 ){
	ld	hl,#_have_diamond + 1
	ld	a,(hl-)
	or	a,(hl)
	jp	NZ,00103$
;StateGame5.c:32: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 24, 24);
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
;StateGame5.c:33: door_x = 186;
	ld	hl,#_door_x
	ld	(hl),#0xba
	inc	hl
	ld	(hl),#0x00
;StateGame5.c:34: door_y = 176;
	ld	hl,#_door_y
	ld	(hl),#0xb0
	inc	hl
	ld	(hl),#0x00
;StateGame5.c:35: SpriteManagerAdd(SPRITE_KEY, 416, 120);
	ld	hl,#0x0078
	push	hl
	ld	hl,#0x01a0
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame5.c:36: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame5.c:38: SpriteManagerAdd(SPRITE_ENEMY, 96, 72);
	ld	hl,#0x0048
	push	hl
	ld	l, #0x60
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame5.c:39: SpriteManagerAdd(SPRITE_ENEMY, 272, 72);
	ld	hl,#0x0048
	push	hl
	ld	hl,#0x0110
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame5.c:40: SpriteManagerAdd(SPRITE_ENEMY, 352, 65);
	ld	hl,#0x0041
	push	hl
	ld	hl,#0x0160
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame5.c:41: SpriteManagerAdd(SPRITE_ENEMY, 178, 65);
	ld	hl,#0x0041
	push	hl
	ld	l, #0xb2
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame5.c:42: SpriteManagerAdd(SPRITE_ENEMY2, 186, 170);
	ld	hl,#0x00aa
	push	hl
	ld	l, #0xba
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00103$:
;StateGame5.c:61: InitScrollTiles(0, 59, tiles, 3);
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
;StateGame5.c:62: InitScroll(map5Width, map5Height, map5, collilision_tiles5, 0, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	ld	hl,#_collilision_tiles5
	push	hl
	ld	hl,#_map5
	push	hl
	ld	hl,#0x0019
	push	hl
	ld	l, #0x38
	push	hl
	call	_InitScrollColor
	add	sp, #13
;StateGame5.c:63: SHOW_BKG;
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
;StateGame5.c:68: void Update_STATE_GAME5() {
;	---------------------------------
; Function Update_STATE_GAME5
; ---------------------------------
_Update_STATE_GAME5::
;StateGame5.c:69: if (KEY_PRESSED(J_START)) {
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	7, c
	ret	Z
;StateGame5.c:70: SetState(STATE_GAME6);
	ld	a,#0x06
	push	af
	inc	sp
	call	_SetState
	inc	sp
	ret
	.area _CODE_2
	.area _CABS (ABS)
