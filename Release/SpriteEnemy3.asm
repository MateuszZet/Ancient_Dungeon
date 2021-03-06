;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module SpriteEnemy3
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TranslateSprite
	.globl _SetSpriteAnim
	.globl _dir_pointer
	.globl _dir
	.globl _bank_SPRITE_ENEMY3
	.globl _anime
	.globl _Start_SPRITE_ENEMY3
	.globl _Update_SPRITE_ENEMY3
	.globl _Destroy_SPRITE_ENEMY3
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_ENEMY3::
	.ds 1
_dir::
	.ds 2
_dir_pointer::
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
;SpriteEnemy3.c:3: UINT8 bank_SPRITE_ENEMY3 = 2;
	ld	hl,#_bank_SPRITE_ENEMY3
	ld	(hl),#0x02
;SpriteEnemy3.c:11: int dir = 0;
	ld	hl,#_dir
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;SpriteEnemy3.c:12: int *dir_pointer = NULL;
	ld	hl,#_dir_pointer
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
;SpriteEnemy3.c:19: void Start_SPRITE_ENEMY3() {
;	---------------------------------
; Function Start_SPRITE_ENEMY3
; ---------------------------------
_Start_SPRITE_ENEMY3::
	add	sp, #-4
;SpriteEnemy3.c:20: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
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
;SpriteEnemy3.c:21: THIS->lim_x=9999;
	ld	hl,#0x0012
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x0f
	ld	(bc),a
	inc	bc
	ld	a,#0x27
	ld	(bc),a
;SpriteEnemy3.c:22: THIS->lim_y=9999;
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
;SpriteEnemy3.c:23: data->vx = 0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;SpriteEnemy3.c:24: data->vy = 1;
	pop	bc
	push	bc
	inc	bc
	ld	a,#0x01
	ld	(bc),a
;SpriteEnemy3.c:26: SetSpriteAnim(THIS, anime, 15);
	ld	a,#0x0f
	push	af
	inc	sp
	ld	hl,#_anime
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
_anime:
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
;SpriteEnemy3.c:30: void Update_SPRITE_ENEMY3() {
;	---------------------------------
; Function Update_SPRITE_ENEMY3
; ---------------------------------
_Update_SPRITE_ENEMY3::
	add	sp, #-4
;SpriteEnemy3.c:33: struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0018
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	sp
	inc	sp
	push	bc
;SpriteEnemy3.c:34: dir_pointer = &dir;
	ld	hl,#_dir_pointer
	ld	(hl),#<(_dir)
	inc	hl
	ld	(hl),#>(_dir)
;SpriteEnemy3.c:36: if (TranslateSprite(THIS, data->vx << delta_time, data->vy << delta_time)) {
	pop	de
	push	de
	ld	hl,#0x0001
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#2
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	b,a
	ld	hl,#_delta_time
	ld	a,(hl)
	inc	a
	jr	00137$
00136$:
	sla	b
00137$:
	dec	a
	jr	NZ,00136$
	pop	de
	push	de
	ld	a,(de)
	ld	c,a
	ld	a,(hl)
	ld	d,c
	inc	a
	jr	00139$
00138$:
	sla	d
00139$:
	dec	a
	jr	NZ,00138$
	push	bc
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
	ld	a,e
	or	a, a
	jp	Z,00114$
;SpriteEnemy3.c:37: if (*dir_pointer == 0) {
	ld	hl,#_dir_pointer + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	or	a,c
	jr	NZ,00110$
;SpriteEnemy3.c:38: data->vx = 1;
	pop	hl
	push	hl
	ld	(hl),#0x01
;SpriteEnemy3.c:39: data->vy = 0;
	ldhl	sp,#2
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x00
;SpriteEnemy3.c:40: *dir_pointer = 1;
	ld	hl,#_dir_pointer + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x01
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
	jp	00114$
00110$:
;SpriteEnemy3.c:42: else if(*dir_pointer == 1) {
	ld	a,c
	dec	a
	jr	NZ,00107$
	ld	a,b
	or	a, a
	jr	NZ,00107$
;SpriteEnemy3.c:43: data->vx = 0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;SpriteEnemy3.c:44: data->vy = -1;
	ldhl	sp,#2
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0xff
;SpriteEnemy3.c:45: *dir_pointer = 2;
	ld	hl,#_dir_pointer + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x02
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
	jp	00114$
00107$:
;SpriteEnemy3.c:47: else if (*dir_pointer == 2) {
	ld	a,c
	sub	a, #0x02
	jr	NZ,00104$
	ld	a,b
	or	a, a
	jr	NZ,00104$
;SpriteEnemy3.c:48: data->vx = -1;
	pop	hl
	push	hl
	ld	(hl),#0xff
;SpriteEnemy3.c:49: data->vy = 0;
	ldhl	sp,#2
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x00
;SpriteEnemy3.c:50: *dir_pointer = 3;
	ld	hl,#_dir_pointer + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x03
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
	jr	00114$
00104$:
;SpriteEnemy3.c:52: else if (*dir_pointer == 3) {
	ld	a,c
	sub	a, #0x03
	jr	NZ,00114$
	ld	a,b
	or	a, a
	jr	NZ,00114$
;SpriteEnemy3.c:53: data->vx = 0;
	pop	hl
	push	hl
	ld	(hl),#0x00
;SpriteEnemy3.c:54: data->vy = 1;
	ldhl	sp,#2
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x01
;SpriteEnemy3.c:55: *dir_pointer = 0;
	ld	hl,#_dir_pointer + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x00
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
00114$:
	add	sp, #4
	ret
;SpriteEnemy3.c:78: void Destroy_SPRITE_ENEMY3() {
;	---------------------------------
; Function Destroy_SPRITE_ENEMY3
; ---------------------------------
_Destroy_SPRITE_ENEMY3::
;SpriteEnemy3.c:79: *dir_pointer = 0;
	ld	hl,#_dir_pointer + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x00
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
	ret
	.area _CODE_2
	.area _CABS (ABS)
