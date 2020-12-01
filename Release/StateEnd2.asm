;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module StateEnd2
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SpriteManagerAdd
	.globl _SpriteManagerLoad
	.globl _InitScrollColor
	.globl _ZInitScrollTilesColor
	.globl _collilision_tiles4
	.globl _bank_STATE_END2
	.globl _Start_STATE_END2
	.globl _Update_STATE_END2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_END2::
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
;StateEnd2.c:3: UINT8 bank_STATE_END2 = 2;
	ld	hl,#_bank_STATE_END2
	ld	(hl),#0x02
;StateEnd2.c:13: UINT8 collilision_tiles4[] = { 1,2,3,4,0 };
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
;StateEnd2.c:15: void Start_STATE_END2() {
;	---------------------------------
; Function Start_STATE_END2
; ---------------------------------
_Start_STATE_END2::
;StateEnd2.c:17: next_lvl =1;
	ld	hl,#_next_lvl
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
;StateEnd2.c:18: NR52_REG = 0x80; //Enables sound, you should always setup this first
	ld	hl,#0xff26
	ld	(hl),#0x80
;StateEnd2.c:19: NR51_REG = 0xFF; //Enables all channels (left and right)
	ld	l, #0x25
	ld	(hl),#0xff
;StateEnd2.c:20: NR50_REG = 0x77; //Max volume
	ld	l, #0x24
	ld	(hl),#0x77
;StateEnd2.c:22: SPRITES_8x16;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;StateEnd2.c:23: for(i = 0; i != n_sprite_types; ++ i) {
	ld	b,#0x00
00103$:
	ld	hl,#_n_sprite_types
	ld	a,(hl)
	sub	a, b
	jr	Z,00101$
;StateEnd2.c:24: SpriteManagerLoad(i);
	push	bc
	push	bc
	inc	sp
	call	_SpriteManagerLoad
	inc	sp
	pop	bc
;StateEnd2.c:23: for(i = 0; i != n_sprite_types; ++ i) {
	inc	b
	jr	00103$
00101$:
;StateEnd2.c:26: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateEnd2.c:28: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 70, 35);
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
;StateEnd2.c:29: SpriteManagerAdd(SPRITE_DIAMOND, 76, 72);
	ld	hl,#0x0048
	push	hl
	ld	l, #0x4c
	push	hl
	ld	a,#0x09
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateEnd2.c:30: SpriteManagerAdd(SPRITE_DIAMOND, 100, 100);
	ld	hl,#0x0064
	push	hl
	ld	l, #0x64
	push	hl
	ld	a,#0x09
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateEnd2.c:31: InitScrollTiles(0, 59, tiles, 3);
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
;StateEnd2.c:32: InitScroll(endWidth,endHeight,end, collilision_tiles4, 0, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	ld	hl,#_collilision_tiles4
	push	hl
	ld	hl,#_end
	push	hl
	ld	hl,#0x0012
	push	hl
	ld	l, #0x14
	push	hl
	call	_InitScrollColor
	add	sp, #13
;StateEnd2.c:33: SHOW_BKG;
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
;StateEnd2.c:38: void Update_STATE_END2() {
;	---------------------------------
; Function Update_STATE_END2
; ---------------------------------
_Update_STATE_END2::
;StateEnd2.c:40: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
