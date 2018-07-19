;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module ZGBMain_Init
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _InitSprites
	.globl _InitStates
	.globl _Destroy_SPRITE_ENEMY2
	.globl _Update_SPRITE_ENEMY2
	.globl _Start_SPRITE_ENEMY2
	.globl _Destroy_SPRITE_DOOROPEN
	.globl _Update_SPRITE_DOOROPEN
	.globl _Start_SPRITE_DOOROPEN
	.globl _Destroy_SPRITE_DOOR
	.globl _Update_SPRITE_DOOR
	.globl _Start_SPRITE_DOOR
	.globl _Destroy_SPRITE_KEY
	.globl _Update_SPRITE_KEY
	.globl _Start_SPRITE_KEY
	.globl _Destroy_SPRITE_ENEMY
	.globl _Update_SPRITE_ENEMY
	.globl _Start_SPRITE_ENEMY
	.globl _Destroy_SPRITE_PLAYER
	.globl _Update_SPRITE_PLAYER
	.globl _Start_SPRITE_PLAYER
	.globl _Update_STATE_GAME3
	.globl _Start_STATE_GAME3
	.globl _Update_STATE_GAME2
	.globl _Start_STATE_GAME2
	.globl _Update_STATE_MENU
	.globl _Start_STATE_MENU
	.globl _Update_STATE_GAME
	.globl _Start_STATE_GAME
	.globl _InitSpriteInfo
	.globl _spritePalDatas
	.globl _n_sprite_types
	.globl _spriteIdxs
	.globl _spriteNumFrames
	.globl _spriteFrameSizes
	.globl _spriteDataBanks
	.globl _spriteDatas
	.globl _spriteDestroyFuncs
	.globl _spriteUpdateFuncs
	.globl _spriteStartFuncs
	.globl _spriteBanks
	.globl _updateFuncs
	.globl _startFuncs
	.globl _stateBanks
	.globl _next_state
	.globl _init_bank
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_init_bank::
	.ds 1
_next_state::
	.ds 1
_stateBanks::
	.ds 6
_startFuncs::
	.ds 12
_updateFuncs::
	.ds 12
_spriteBanks::
	.ds 6
_spriteStartFuncs::
	.ds 12
_spriteUpdateFuncs::
	.ds 12
_spriteDestroyFuncs::
	.ds 12
_spriteDatas::
	.ds 12
_spriteDataBanks::
	.ds 6
_spriteFrameSizes::
	.ds 6
_spriteNumFrames::
	.ds 6
_spriteIdxs::
	.ds 6
_n_sprite_types::
	.ds 1
_spritePalDatas::
	.ds 12
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
;ZGBMain_Init.c:3: UINT8 init_bank = 1;
	ld	hl,#_init_bank
	ld	(hl),#0x01
;ZGBMain_Init.c:32: UINT8 next_state = STATE_MENU;
	ld	hl,#_next_state
	ld	(hl),#0x00
;ZGBMain_Init.c:35: SET_N_SPRITE_TYPES(N_SPRITE_TYPES);
	ld	hl,#_n_sprite_types
	ld	(hl),#0x06
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_1
;ZGBMain_Init.c:37: void InitStates() {
;	---------------------------------
; Function InitStates
; ---------------------------------
_InitStates::
;ZGBMain_Init.c:38: INIT_STATE(STATE_MENU);
	ld	de,#_stateBanks
	ld	hl,#_bank_STATE_MENU
	ld	a,(hl)
	ld	(de),a
	ld	hl,#_startFuncs
	ld	(hl),#<(_Start_STATE_MENU)
	inc	hl
	ld	(hl),#>(_Start_STATE_MENU)
	ld	hl,#_updateFuncs
	ld	(hl),#<(_Update_STATE_MENU)
	inc	hl
	ld	(hl),#>(_Update_STATE_MENU)
;ZGBMain_Init.c:39: INIT_STATE(STATE_GAME);
	ld	de,#(_stateBanks + 0x0001)
	ld	hl,#_bank_STATE_GAME
	ld	a,(hl)
	ld	(de),a
	ld	hl,#(_startFuncs + 0x0002)
	ld	(hl),#<(_Start_STATE_GAME)
	inc	hl
	ld	(hl),#>(_Start_STATE_GAME)
	ld	hl,#(_updateFuncs + 0x0002)
	ld	(hl),#<(_Update_STATE_GAME)
	inc	hl
	ld	(hl),#>(_Update_STATE_GAME)
;ZGBMain_Init.c:40: INIT_STATE(STATE_GAME2);
	ld	de,#(_stateBanks + 0x0002)
	ld	hl,#_bank_STATE_GAME2
	ld	a,(hl)
	ld	(de),a
	ld	hl,#(_startFuncs + 0x0004)
	ld	(hl),#<(_Start_STATE_GAME2)
	inc	hl
	ld	(hl),#>(_Start_STATE_GAME2)
	ld	hl,#(_updateFuncs + 0x0004)
	ld	(hl),#<(_Update_STATE_GAME2)
	inc	hl
	ld	(hl),#>(_Update_STATE_GAME2)
;ZGBMain_Init.c:41: INIT_STATE(STATE_GAME3);
	ld	de,#(_stateBanks + 0x0003)
	ld	hl,#_bank_STATE_GAME3
	ld	a,(hl)
	ld	(de),a
	ld	hl,#(_startFuncs + 0x0006)
	ld	(hl),#<(_Start_STATE_GAME3)
	inc	hl
	ld	(hl),#>(_Start_STATE_GAME3)
	ld	hl,#(_updateFuncs + 0x0006)
	ld	(hl),#<(_Update_STATE_GAME3)
	inc	hl
	ld	(hl),#>(_Update_STATE_GAME3)
	ret
;ZGBMain_Init.c:44: void InitSprites() {
;	---------------------------------
; Function InitSprites
; ---------------------------------
_InitSprites::
;ZGBMain_Init.c:45: INIT_SPRITE(SPRITE_PLAYER, player, 3, FRAME_16x16, 9);
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0902
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_player
	push	hl
	ld	hl,#_Destroy_SPRITE_PLAYER
	push	hl
	ld	hl,#_Update_SPRITE_PLAYER
	push	hl
	ld	hl,#_Start_SPRITE_PLAYER
	push	hl
	ld	hl,#_bank_SPRITE_PLAYER
	ld	a,(hl)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_InitSpriteInfo
	add	sp, #15
;ZGBMain_Init.c:46: INIT_SPRITE(SPRITE_ENEMY, enemy, 3, FRAME_16x16, 5);
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0502
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_enemy
	push	hl
	ld	hl,#_Destroy_SPRITE_ENEMY
	push	hl
	ld	hl,#_Update_SPRITE_ENEMY
	push	hl
	ld	hl,#_Start_SPRITE_ENEMY
	push	hl
	ld	hl,#_bank_SPRITE_ENEMY
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,#0x01
	push	af
	inc	sp
	call	_InitSpriteInfo
	add	sp, #15
;ZGBMain_Init.c:48: INIT_SPRITE(SPRITE_KEY, key, 3, FRAME_16x16, 6);
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0602
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_key
	push	hl
	ld	hl,#_Destroy_SPRITE_KEY
	push	hl
	ld	hl,#_Update_SPRITE_KEY
	push	hl
	ld	hl,#_Start_SPRITE_KEY
	push	hl
	ld	hl,#_bank_SPRITE_KEY
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,#0x03
	push	af
	inc	sp
	call	_InitSpriteInfo
	add	sp, #15
;ZGBMain_Init.c:49: INIT_SPRITE(SPRITE_DOOR, door, 3, FRAME_16x16, 1);
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0102
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_door
	push	hl
	ld	hl,#_Destroy_SPRITE_DOOR
	push	hl
	ld	hl,#_Update_SPRITE_DOOR
	push	hl
	ld	hl,#_Start_SPRITE_DOOR
	push	hl
	ld	hl,#_bank_SPRITE_DOOR
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,#0x04
	push	af
	inc	sp
	call	_InitSpriteInfo
	add	sp, #15
;ZGBMain_Init.c:50: INIT_SPRITE(SPRITE_DOOROPEN, dooropen, 3, FRAME_16x16, 1);
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0102
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_dooropen
	push	hl
	ld	hl,#_Destroy_SPRITE_DOOROPEN
	push	hl
	ld	hl,#_Update_SPRITE_DOOROPEN
	push	hl
	ld	hl,#_Start_SPRITE_DOOROPEN
	push	hl
	ld	hl,#_bank_SPRITE_DOOROPEN
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,#0x05
	push	af
	inc	sp
	call	_InitSpriteInfo
	add	sp, #15
;ZGBMain_Init.c:51: INIT_SPRITE(SPRITE_ENEMY2, enemy2, 3, FRAME_16x16, 6);
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0602
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_enemy2
	push	hl
	ld	hl,#_Destroy_SPRITE_ENEMY2
	push	hl
	ld	hl,#_Update_SPRITE_ENEMY2
	push	hl
	ld	hl,#_Start_SPRITE_ENEMY2
	push	hl
	ld	hl,#_bank_SPRITE_ENEMY2
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,#0x02
	push	af
	inc	sp
	call	_InitSpriteInfo
	add	sp, #15
	ret
	.area _CODE_1
	.area _CABS (ABS)
