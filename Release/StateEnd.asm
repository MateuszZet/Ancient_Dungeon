;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module StateEnd
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SpriteManagerAdd
	.globl _SpriteManagerLoad
	.globl _InitScrollColor
	.globl _ZInitScrollTilesColor
	.globl _collilision_tiles4
	.globl _bank_STATE_END
	.globl _Start_STATE_END
	.globl _Update_STATE_END
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_END::
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
;StateEnd.c:3: UINT8 bank_STATE_END = 2;
	ld	hl,#_bank_STATE_END
	ld	(hl),#0x02
;StateEnd.c:14: UINT8 collilision_tiles4[] = { 1,2,3,4,0 };
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
;StateEnd.c:16: void Start_STATE_END() {
;	---------------------------------
; Function Start_STATE_END
; ---------------------------------
_Start_STATE_END::
;StateEnd.c:18: next_lvl =1;
	ld	hl,#_next_lvl
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
;StateEnd.c:19: NR52_REG = 0x80; //Enables sound, you should always setup this first
	ld	hl,#0xff26
	ld	(hl),#0x80
;StateEnd.c:20: NR51_REG = 0xFF; //Enables all channels (left and right)
	ld	l, #0x25
	ld	(hl),#0xff
;StateEnd.c:21: NR50_REG = 0x77; //Max volume
	ld	l, #0x24
	ld	(hl),#0x77
;StateEnd.c:23: SPRITES_8x16;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;StateEnd.c:24: for(i = 0; i != n_sprite_types; ++ i) {
	ld	b,#0x00
00103$:
	ld	hl,#_n_sprite_types
	ld	a,(hl)
	sub	a, b
	jr	Z,00101$
;StateEnd.c:25: SpriteManagerLoad(i);
	push	bc
	push	bc
	inc	sp
	call	_SpriteManagerLoad
	inc	sp
	pop	bc
;StateEnd.c:24: for(i = 0; i != n_sprite_types; ++ i) {
	inc	b
	jr	00103$
00101$:
;StateEnd.c:27: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateEnd.c:29: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 70, 35);
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
;StateEnd.c:30: SpriteManagerAdd(SPRITE_DIAMOND, 76, 72);
	ld	hl,#0x0048
	push	hl
	ld	l, #0x4c
	push	hl
	ld	a,#0x09
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateEnd.c:31: InitScrollTiles(0, 59, tiles, 3);
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
;StateEnd.c:32: InitScroll(endWidth,endHeight,end, collilision_tiles4, 0, 3);
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
;StateEnd.c:33: SHOW_BKG;
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
;StateEnd.c:38: void Update_STATE_END() {
;	---------------------------------
; Function Update_STATE_END
; ---------------------------------
_Update_STATE_END::
;StateEnd.c:40: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
