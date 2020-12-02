;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module StateGame4
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SpriteManagerAdd
	.globl _SpriteManagerLoad
	.globl _InitScrollColor
	.globl _ZInitScrollTilesColor
	.globl _SetState
	.globl _collilision_tiles4
	.globl _bank_STATE_GAME4
	.globl _Start_STATE_GAME4
	.globl _Update_STATE_GAME4
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_GAME4::
	.ds 1
_collilision_tiles4::
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
;StateGame4.c:3: UINT8 bank_STATE_GAME4 = 2;
	ld	hl,#_bank_STATE_GAME4
	ld	(hl),#0x02
;StateGame4.c:14: UINT8 collilision_tiles4[] = { 1,2,3,4,0 };
	ld	hl,#_collilision_tiles4
	ld	(hl),#0x01
	ld	hl,#(_collilision_tiles4 + 0x0001)
	ld	(hl),#0x02
	ld	hl,#(_collilision_tiles4 + 0x0002)
	ld	(hl),#0x03
	ld	hl,#(_collilision_tiles4 + 0x0003)
	ld	(hl),#0x04
	ld	hl,#(_collilision_tiles4 + 0x0004)
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
;StateGame4.c:16: void Start_STATE_GAME4() {
;	---------------------------------
; Function Start_STATE_GAME4
; ---------------------------------
_Start_STATE_GAME4::
;StateGame4.c:18: next_lvl=5;
	ld	hl,#_next_lvl
	ld	(hl),#0x05
	inc	hl
	ld	(hl),#0x00
;StateGame4.c:19: NR52_REG = 0x80; //Enables sound, you should always setup this first
	ld	hl,#0xff26
	ld	(hl),#0x80
;StateGame4.c:20: NR51_REG = 0xFF; //Enables all channels (left and right)
	ld	l, #0x25
	ld	(hl),#0xff
;StateGame4.c:21: NR50_REG = 0x77; //Max volume
	ld	l, #0x24
	ld	(hl),#0x77
;StateGame4.c:23: SPRITES_8x16;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;StateGame4.c:24: for(i = 0; i != n_sprite_types; ++ i) {
	ld	b,#0x00
00113$:
	ld	hl,#_n_sprite_types
	ld	a,(hl)
	sub	a, b
	jr	Z,00101$
;StateGame4.c:25: SpriteManagerLoad(i);
	push	bc
	push	bc
	inc	sp
	call	_SpriteManagerLoad
	inc	sp
	pop	bc
;StateGame4.c:24: for(i = 0; i != n_sprite_types; ++ i) {
	inc	b
	jr	00113$
00101$:
;StateGame4.c:27: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateGame4.c:29: have_bomb=2;
	ld	hl,#_have_bomb
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x00
;StateGame4.c:31: if( have_diamond == 0 ){
	ld	hl,#_have_diamond + 1
	ld	a,(hl-)
	or	a,(hl)
	jp	NZ,00103$
;StateGame4.c:32: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 200, 200);
	ld	hl,#0x00c8
	push	hl
	ld	l, #0xc8
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
;StateGame4.c:33: door_x = 343;
	ld	hl,#_door_x
	ld	(hl),#0x57
	inc	hl
	ld	(hl),#0x01
;StateGame4.c:34: door_y = 343;
	ld	hl,#_door_y
	ld	(hl),#0x57
	inc	hl
	ld	(hl),#0x01
;StateGame4.c:35: SpriteManagerAdd(SPRITE_KEY, 38, 38);
	ld	hl,#0x0026
	push	hl
	ld	l, #0x26
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:36: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame4.c:38: SpriteManagerAdd(SPRITE_ENEMY3, 352, 190);
	ld	hl,#0x00be
	push	hl
	ld	hl,#0x0160
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:39: SpriteManagerAdd(SPRITE_ENEMY3, 88, 144);
	ld	hl,#0x0090
	push	hl
	ld	l, #0x58
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:40: SpriteManagerAdd(SPRITE_ENEMY2, 272, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x0110
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:41: SpriteManagerAdd(SPRITE_ENEMY, 94, 280);
	ld	hl,#0x0118
	push	hl
	ld	hl,#0x005e
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:42: SpriteManagerAdd(SPRITE_ENEMY, 272, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x0110
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:43: SpriteManagerAdd(SPRITE_ENEMY2, 94, 280);
	ld	hl,#0x0118
	push	hl
	ld	hl,#0x005e
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:44: SpriteManagerAdd(SPRITE_ENEMY2, 312, 344);
	ld	hl,#0x0158
	push	hl
	ld	l, #0x38
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00103$:
;StateGame4.c:47: if( have_diamond == 1 ){
	ld	hl,#_have_diamond
	ld	a,(hl)
	dec	a
	jp	NZ,00105$
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00105$
;StateGame4.c:48: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 38, 38);
	ld	hl,#0x0026
	push	hl
	ld	l, #0x26
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
;StateGame4.c:49: door_x = 192;
	ld	hl,#_door_x
	ld	(hl),#0xc0
	inc	hl
	ld	(hl),#0x00
;StateGame4.c:50: door_y = 192;
	ld	hl,#_door_y
	ld	(hl),#0xc0
	inc	hl
	ld	(hl),#0x00
;StateGame4.c:51: SpriteManagerAdd(SPRITE_KEY, 343, 343);
	ld	hl,#0x0157
	push	hl
	ld	l, #0x57
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:52: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame4.c:54: SpriteManagerAdd(SPRITE_ENEMY2, 272, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x0110
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:55: SpriteManagerAdd(SPRITE_ENEMY, 94, 280);
	ld	hl,#0x0118
	push	hl
	ld	hl,#0x005e
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:56: SpriteManagerAdd(SPRITE_ENEMY, 272, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x0110
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:57: SpriteManagerAdd(SPRITE_ENEMY, 192, 192);
	ld	hl,#0x00c0
	push	hl
	ld	l, #0xc0
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:58: SpriteManagerAdd(SPRITE_ENEMY2, 192, 192);
	ld	hl,#0x00c0
	push	hl
	ld	l, #0xc0
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:59: SpriteManagerAdd(SPRITE_ENEMY2, 94, 280);	
	ld	hl,#0x0118
	push	hl
	ld	hl,#0x005e
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00105$:
;StateGame4.c:62: if( have_diamond == 3 ){
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x03
	jp	NZ,00107$
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00107$
;StateGame4.c:63: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 38, 38);
	ld	hl,#0x0026
	push	hl
	ld	l, #0x26
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
;StateGame4.c:64: door_x = 192;
	ld	hl,#_door_x
	ld	(hl),#0xc0
	inc	hl
	ld	(hl),#0x00
;StateGame4.c:65: door_y = 192;
	ld	hl,#_door_y
	ld	(hl),#0xc0
	inc	hl
	ld	(hl),#0x00
;StateGame4.c:66: SpriteManagerAdd(SPRITE_KEY, 343, 343);
	ld	hl,#0x0157
	push	hl
	ld	l, #0x57
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:67: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame4.c:69: SpriteManagerAdd(SPRITE_ENEMY2, 272, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x0110
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:70: SpriteManagerAdd(SPRITE_ENEMY3, 94, 280);
	ld	hl,#0x0118
	push	hl
	ld	hl,#0x005e
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:71: SpriteManagerAdd(SPRITE_ENEMY, 272, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x0110
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:72: SpriteManagerAdd(SPRITE_ENEMY3, 192, 192);
	ld	hl,#0x00c0
	push	hl
	ld	l, #0xc0
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:73: SpriteManagerAdd(SPRITE_ENEMY2, 192, 192);
	ld	hl,#0x00c0
	push	hl
	ld	l, #0xc0
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:74: SpriteManagerAdd(SPRITE_ENEMY2, 94, 280);	
	ld	hl,#0x0118
	push	hl
	ld	hl,#0x005e
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:75: SpriteManagerAdd(SPRITE_ENEMY3, 352, 190);
	ld	hl,#0x00be
	push	hl
	ld	hl,#0x0160
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00107$:
;StateGame4.c:78: if( have_diamond == 6 ){
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x06
	jp	NZ,00109$
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00109$
;StateGame4.c:79: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 343, 343);
	ld	hl,#0x0157
	push	hl
	ld	l, #0x57
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
;StateGame4.c:80: door_x = 38;
	ld	hl,#_door_x
	ld	(hl),#0x26
	inc	hl
	ld	(hl),#0x00
;StateGame4.c:81: door_y = 38;
	ld	hl,#_door_y
	ld	(hl),#0x26
	inc	hl
	ld	(hl),#0x00
;StateGame4.c:82: SpriteManagerAdd(SPRITE_KEY, 192, 192);
	ld	hl,#0x00c0
	push	hl
	ld	l, #0xc0
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:83: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame4.c:85: SpriteManagerAdd(SPRITE_ENEMY2, 272, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x0110
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:86: SpriteManagerAdd(SPRITE_ENEMY, 94, 280);
	ld	hl,#0x0118
	push	hl
	ld	hl,#0x005e
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:87: SpriteManagerAdd(SPRITE_ENEMY, 272, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x0110
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:88: SpriteManagerAdd(SPRITE_ENEMY, 192, 192);
	ld	hl,#0x00c0
	push	hl
	ld	l, #0xc0
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:89: SpriteManagerAdd(SPRITE_ENEMY2, 192, 192);
	ld	hl,#0x00c0
	push	hl
	ld	l, #0xc0
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:90: SpriteManagerAdd(SPRITE_ENEMY2, 94, 280);	
	ld	hl,#0x0118
	push	hl
	ld	hl,#0x005e
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:91: SpriteManagerAdd(SPRITE_ENEMY3, 352, 190);
	ld	hl,#0x00be
	push	hl
	ld	hl,#0x0160
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00109$:
;StateGame4.c:94: if( have_diamond == 10 ){
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x0a
	jp	NZ,00111$
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00111$
;StateGame4.c:95: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 200, 200);
	ld	hl,#0x00c8
	push	hl
	ld	l, #0xc8
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
;StateGame4.c:96: door_x = 38;
	ld	hl,#_door_x
	ld	(hl),#0x26
	inc	hl
	ld	(hl),#0x00
;StateGame4.c:97: door_y = 38;
	ld	hl,#_door_y
	ld	(hl),#0x26
	inc	hl
	ld	(hl),#0x00
;StateGame4.c:98: SpriteManagerAdd(SPRITE_KEY, 343, 343);
	ld	hl,#0x0157
	push	hl
	ld	l, #0x57
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:99: SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
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
;StateGame4.c:101: SpriteManagerAdd(SPRITE_ENEMY, 320, 190);
	ld	hl,#0x00be
	push	hl
	ld	hl,#0x0140
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:102: SpriteManagerAdd(SPRITE_ENEMY3, 88, 144);
	ld	hl,#0x0090
	push	hl
	ld	l, #0x58
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:103: SpriteManagerAdd(SPRITE_ENEMY2, 272, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x0110
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:104: SpriteManagerAdd(SPRITE_ENEMY, 94, 280);
	ld	hl,#0x0118
	push	hl
	ld	hl,#0x005e
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:105: SpriteManagerAdd(SPRITE_ENEMY, 272, 112);
	ld	hl,#0x0070
	push	hl
	ld	hl,#0x0110
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:106: SpriteManagerAdd(SPRITE_ENEMY2, 94, 280);
	ld	hl,#0x0118
	push	hl
	ld	hl,#0x005e
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateGame4.c:107: SpriteManagerAdd(SPRITE_ENEMY2, 312, 344);	
	ld	hl,#0x0158
	push	hl
	ld	l, #0x38
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00111$:
;StateGame4.c:110: InitScrollTiles(0, 59, tiles, 3);
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
;StateGame4.c:111: InitScroll(map4Width, map4Height, map4, collilision_tiles4, 0, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	ld	hl,#_collilision_tiles4
	push	hl
	ld	hl,#_map4
	push	hl
	ld	hl,#0x0032
	push	hl
	ld	l, #0x32
	push	hl
	call	_InitScrollColor
	add	sp, #13
;StateGame4.c:112: SHOW_BKG;
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
;StateGame4.c:117: void Update_STATE_GAME4() {
;	---------------------------------
; Function Update_STATE_GAME4
; ---------------------------------
_Update_STATE_GAME4::
;StateGame4.c:118: if (KEY_PRESSED(J_START)) {
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	7, c
	ret	Z
;StateGame4.c:119: SetState(STATE_GAME5);
	ld	a,#0x05
	push	af
	inc	sp
	call	_SetState
	inc	sp
	ret
	.area _CODE_2
	.area _CABS (ABS)
