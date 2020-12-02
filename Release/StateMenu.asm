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
;StateMenu.c:13: UINT8 collilision_tiles0[] = { 1,2,3,4,0 };
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
;StateMenu.c:15: void Start_STATE_MENU() {
;	---------------------------------
; Function Start_STATE_MENU
; ---------------------------------
_Start_STATE_MENU::
;StateMenu.c:17: next_lvl =1;
	ld	hl,#_next_lvl
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
;StateMenu.c:18: NR52_REG = 0x80; //Enables sound, you should always setup this first
	ld	hl,#0xff26
	ld	(hl),#0x80
;StateMenu.c:19: NR51_REG = 0xFF; //Enables all channels (left and right)
	ld	l, #0x25
	ld	(hl),#0xff
;StateMenu.c:20: NR50_REG = 0x77; //Max volume
	ld	l, #0x24
	ld	(hl),#0x77
;StateMenu.c:22: SPRITES_8x16;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;StateMenu.c:23: for(i = 0; i != n_sprite_types; ++ i) {
	ld	b,#0x00
00119$:
	ld	hl,#_n_sprite_types
	ld	a,(hl)
	sub	a, b
	jr	Z,00101$
;StateMenu.c:24: SpriteManagerLoad(i);
	push	bc
	push	bc
	inc	sp
	call	_SpriteManagerLoad
	inc	sp
	pop	bc
;StateMenu.c:23: for(i = 0; i != n_sprite_types; ++ i) {
	inc	b
	jr	00119$
00101$:
;StateMenu.c:26: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateMenu.c:28: scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 70, 35);
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
;StateMenu.c:29: door_x = 20;
	ld	hl,#_door_x
	ld	(hl),#0x14
	inc	hl
	ld	(hl),#0x00
;StateMenu.c:30: door_y = 120;
	ld	hl,#_door_y
	ld	(hl),#0x78
	inc	hl
	ld	(hl),#0x00
;StateMenu.c:32: if( have_diamond == 5 || have_diamond == 13){
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x05
	jr	NZ,00161$
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	Z,00102$
00161$:
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x0d
	jr	NZ,00103$
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	NZ,00103$
00102$:
;StateMenu.c:33: have_bomb=0;
	ld	hl,#_have_bomb
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	jr	00104$
00103$:
;StateMenu.c:36: have_bomb = 6;
	ld	hl,#_have_bomb
	ld	(hl),#0x06
	inc	hl
	ld	(hl),#0x00
00104$:
;StateMenu.c:39: if( have_diamond == 0){
	ld	hl,#_have_diamond + 1
	ld	a,(hl-)
	or	a,(hl)
	jp	NZ,00107$
;StateMenu.c:40: SpriteManagerAdd(SPRITE_KEY, 20, 20);
	ld	hl,#0x0014
	push	hl
	ld	l, #0x14
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:41: SpriteManagerAdd(SPRITE_DOOR,door_x, door_y);
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
;StateMenu.c:42: SpriteManagerAdd(SPRITE_ENEMY, 128, 112);
	ld	hl,#0x0070
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:43: SpriteManagerAdd(SPRITE_ENEMY2, 50, 115 );
	ld	hl,#0x0073
	push	hl
	ld	l, #0x32
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:44: SpriteManagerAdd(SPRITE_ENEMY3, 30, 30);
	ld	hl,#0x001e
	push	hl
	ld	l, #0x1e
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00107$:
;StateMenu.c:47: if( have_diamond == 1){
	ld	hl,#_have_diamond
	ld	a,(hl)
	dec	a
	jr	NZ,00109$
	inc	hl
	ld	a,(hl)
	or	a, a
	jr	NZ,00109$
;StateMenu.c:48: SpriteManagerAdd(SPRITE_KEY, 20, 20);
	ld	hl,#0x0014
	push	hl
	ld	l, #0x14
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:49: SpriteManagerAdd(SPRITE_DOOR,door_x, door_y);
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
00109$:
;StateMenu.c:52: if ( have_diamond == 3 ){
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x03
	jp	NZ,00111$
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00111$
;StateMenu.c:53: SpriteManagerAdd(SPRITE_KEY, 20, 20);
	ld	hl,#0x0014
	push	hl
	ld	l, #0x14
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:54: SpriteManagerAdd(SPRITE_DOOR,door_x, door_y);
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
;StateMenu.c:55: SpriteManagerAdd(SPRITE_ENEMY, 128, 112);
	ld	hl,#0x0070
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00111$:
;StateMenu.c:58: if( have_diamond == 6){
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x06
	jp	NZ,00113$
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00113$
;StateMenu.c:59: SpriteManagerAdd(SPRITE_KEY, 20, 20);
	ld	hl,#0x0014
	push	hl
	ld	l, #0x14
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:60: SpriteManagerAdd(SPRITE_DOOR,door_x, door_y);
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
;StateMenu.c:61: SpriteManagerAdd(SPRITE_ENEMY, 128, 112);
	ld	hl,#0x0070
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:62: SpriteManagerAdd(SPRITE_ENEMY2, 50, 115 );
	ld	hl,#0x0073
	push	hl
	ld	l, #0x32
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00113$:
;StateMenu.c:65: if( have_diamond == 10){
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x0a
	jp	NZ,00115$
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00115$
;StateMenu.c:66: SpriteManagerAdd(SPRITE_KEY, 20, 20);
	ld	hl,#0x0014
	push	hl
	ld	l, #0x14
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:67: SpriteManagerAdd(SPRITE_DOOR,door_x, door_y);	
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
;StateMenu.c:68: SpriteManagerAdd(SPRITE_ENEMY, 128, 112);
	ld	hl,#0x0070
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:69: SpriteManagerAdd(SPRITE_ENEMY2, 50, 115 );
	ld	hl,#0x0073
	push	hl
	ld	l, #0x32
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:70: SpriteManagerAdd(SPRITE_ENEMY3, 30, 30);
	ld	hl,#0x001e
	push	hl
	ld	l, #0x1e
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00115$:
;StateMenu.c:73: if( have_diamond == 15){
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x0f
	jp	NZ,00117$
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00117$
;StateMenu.c:74: SpriteManagerAdd(SPRITE_ENEMY, 128, 112);
	ld	hl,#0x0070
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:75: SpriteManagerAdd(SPRITE_ENEMY2, 50, 115 );
	ld	hl,#0x0073
	push	hl
	ld	l, #0x32
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:76: SpriteManagerAdd(SPRITE_ENEMY3, 30, 30);
	ld	hl,#0x001e
	push	hl
	ld	l, #0x1e
	push	hl
	ld	a,#0x08
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;StateMenu.c:77: SpriteManagerAdd(SPRITE_DIAMOND, 128, 112);
	ld	hl,#0x0070
	push	hl
	ld	l, #0x80
	push	hl
	ld	a,#0x09
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
00117$:
;StateMenu.c:80: InitScrollTiles(0, 59, tiles, 3);
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
;StateMenu.c:81: InitScroll(menuWidth,menuHeight,menu, collilision_tiles0, 0, 3);
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
;StateMenu.c:82: SHOW_BKG;
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
;StateMenu.c:87: void Update_STATE_MENU(){
;	---------------------------------
; Function Update_STATE_MENU
; ---------------------------------
_Update_STATE_MENU::
;StateMenu.c:88: if (KEY_PRESSED(J_START) && have_diamond<15) {
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	7, c
	jr	Z,00102$
	ld	hl,#_have_diamond
	ld	a, (hl)
	sub	a, #0x0f
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a,#0x00
	ld	e, a
	bit	7, e
	jr	Z,00122$
	bit	7, d
	jr	NZ,00123$
	cp	a, a
	jr	00123$
00122$:
	bit	7, d
	jr	Z,00123$
	scf
00123$:
	jr	NC,00102$
;StateMenu.c:89: SetState(STATE_GAME);
	ld	a,#0x01
	push	af
	inc	sp
	call	_SetState
	inc	sp
00102$:
;StateMenu.c:91: if (KEY_PRESSED(J_SELECT) || have_diamond==16){
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	6, c
	jr	NZ,00104$
	ld	hl,#_have_diamond
	ld	a,(hl)
	sub	a, #0x10
	ret	NZ
	inc	hl
	ld	a,(hl)
	or	a, a
	ret	NZ
00104$:
;StateMenu.c:92: have_diamond = 0;
	ld	hl,#_have_diamond
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;StateMenu.c:93: SetState(STATE_MENU);
	xor	a, a
	push	af
	inc	sp
	call	_SetState
	inc	sp
	ret
	.area _CODE_2
	.area _CABS (ABS)
