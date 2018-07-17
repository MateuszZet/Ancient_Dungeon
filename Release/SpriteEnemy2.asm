;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module SpriteEnemy2
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PlayFx
	.globl _TranslateSprite
	.globl _SetSpriteAnim
	.globl _dir_pointer2
	.globl _dir2
	.globl _bank_SPRITE_ENEMY2
	.globl _anime_right
	.globl _anime_left
	.globl _Start_SPRITE_ENEMY2
	.globl _Update_SPRITE_ENEMY2
	.globl _Destroy_SPRITE_ENEMY2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_ENEMY2::
	.ds 1
_dir2::
	.ds 2
_dir_pointer2::
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
;SpriteEnemy2.c:3: UINT8 bank_SPRITE_ENEMY2 = 2;
	ld	hl,#_bank_SPRITE_ENEMY2
	ld	(hl),#0x02
;SpriteEnemy2.c:11: int dir2=0;
	ld	hl,#_dir2
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;SpriteEnemy2.c:12: int *dir_pointer2 = NULL;
	ld	hl,#_dir_pointer2
	ld	(hl),#0x00
	inc	hl
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
;SpriteEnemy2.c:21: void Start_SPRITE_ENEMY2() {
;	---------------------------------
; Function Start_SPRITE_ENEMY2
; ---------------------------------
_Start_SPRITE_ENEMY2::
	add	sp, #-4
;SpriteEnemy2.c:22: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0018
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#2
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
;SpriteEnemy2.c:23: THIS->lim_x=9999;
	ld	hl,#0x0012
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x0f
	ld	(bc),a
	inc	bc
	ld	a,#0x27
	ld	(bc),a
;SpriteEnemy2.c:24: THIS->lim_y=9999;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0014
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x0f
	ld	(bc),a
	inc	bc
	ld	a,#0x27
	ld	(bc),a
;SpriteEnemy2.c:25: data->vx = 1;
	pop	hl
	push	hl
	ld	(hl),#0x01
;SpriteEnemy2.c:27: SetSpriteAnim(THIS, anime_right, 15);
	ld	a,#0x0f
	push	af
	inc	sp
	ld	hl,#_anime_right
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
	add	sp, #4
	ret
_anime_left:
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
_anime_right:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
;SpriteEnemy2.c:31: void Update_SPRITE_ENEMY2() {
;	---------------------------------
; Function Update_SPRITE_ENEMY2
; ---------------------------------
_Update_SPRITE_ENEMY2::
	dec	sp
;SpriteEnemy2.c:32: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0018
	add	hl,bc
	ld	c,l
	ld	b,h
;SpriteEnemy2.c:33: dir_pointer2 = &dir2;
	ld	hl,#_dir_pointer2
	ld	(hl),#<(_dir2)
	inc	hl
	ld	(hl),#>(_dir2)
;SpriteEnemy2.c:35: if(TranslateSprite(THIS, data->vx << delta_time,0)) {
	ld	a,(bc)
	ld	d,a
	ld	hl,#_delta_time
	ld	a,(hl)
	inc	a
	jr	00117$
00116$:
	sla	d
00117$:
	dec	a
	jr	NZ,00116$
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_TranslateSprite
	add	sp, #4
	pop	bc
	ld	a,e
	or	a, a
	jp	Z,00106$
;SpriteEnemy2.c:37: data->vx = -data->vx;
	ld	a,(bc)
	ldhl	sp,#0
	ld	(hl),a
	xor	a, a
	sub	a, (hl)
	ld	(hl),a
	ld	a,(hl)
	ld	(bc),a
;SpriteEnemy2.c:39: PlayFx(CHANNEL_4, 4, 0x0c, 0x41, 0x30, 0xc0);
	ld	hl,#0x00c0
	push	hl
	ld	l, #0x30
	push	hl
	ld	l, #0x41
	push	hl
	ld	l, #0x0c
	push	hl
	ld	hl,#0x0403
	push	hl
	call	_PlayFx
	add	sp, #10
;SpriteEnemy2.c:40: if (dir2 == 0 ) {
	ld	hl,#_dir2 + 1
	ld	a,(hl-)
	or	a,(hl)
	jr	NZ,00102$
;SpriteEnemy2.c:41: SetSpriteAnim(THIS, anime_left, 15);
	ld	a,#0x0f
	push	af
	inc	sp
	ld	hl,#_anime_left
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
;SpriteEnemy2.c:42: *dir_pointer2 = 1;
	ld	hl,#_dir_pointer2 + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x01
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
	jr	00106$
00102$:
;SpriteEnemy2.c:45: SetSpriteAnim(THIS, anime_right, 15);
	ld	a,#0x0f
	push	af
	inc	sp
	ld	hl,#_anime_right
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
;SpriteEnemy2.c:46: *dir_pointer2 = 0;
	ld	hl,#_dir_pointer2 + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x00
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
00106$:
	inc	sp
	ret
;SpriteEnemy2.c:53: void Destroy_SPRITE_ENEMY2() {
;	---------------------------------
; Function Destroy_SPRITE_ENEMY2
; ---------------------------------
_Destroy_SPRITE_ENEMY2::
;SpriteEnemy2.c:54: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
