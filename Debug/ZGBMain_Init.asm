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
	.globl _Destroy_SPRITE_ENEMY
	.globl _Update_SPRITE_ENEMY
	.globl _Start_SPRITE_ENEMY
	.globl _Destroy_SPRITE_PLAYER
	.globl _Update_SPRITE_PLAYER
	.globl _Start_SPRITE_PLAYER
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
	.ds 1
_startFuncs::
	.ds 2
_updateFuncs::
	.ds 2
_spriteBanks::
	.ds 2
_spriteStartFuncs::
	.ds 4
_spriteUpdateFuncs::
	.ds 4
_spriteDestroyFuncs::
	.ds 4
_spriteDatas::
	.ds 4
_spriteDataBanks::
	.ds 2
_spriteFrameSizes::
	.ds 2
_spriteNumFrames::
	.ds 2
_spriteIdxs::
	.ds 2
_n_sprite_types::
	.ds 1
_spritePalDatas::
	.ds 4
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
;ZGBMain_Init.c:16: UINT8 next_state = STATE_GAME;
	ld	hl,#_next_state
	ld	(hl),#0x00
;ZGBMain_Init.c:19: SET_N_SPRITE_TYPES(N_SPRITE_TYPES);
	ld	hl,#_n_sprite_types
	ld	(hl),#0x02
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_1
;ZGBMain_Init.c:21: void InitStates() {
;	---------------------------------
; Function InitStates
; ---------------------------------
_InitStates::
;ZGBMain_Init.c:22: INIT_STATE(STATE_GAME);
	ld	de,#_stateBanks
	ld	hl,#_bank_STATE_GAME
	ld	a,(hl)
	ld	(de),a
	ld	hl,#_startFuncs
	ld	(hl),#<(_Start_STATE_GAME)
	inc	hl
	ld	(hl),#>(_Start_STATE_GAME)
	ld	hl,#_updateFuncs
	ld	(hl),#<(_Update_STATE_GAME)
	inc	hl
	ld	(hl),#>(_Update_STATE_GAME)
	ret
;ZGBMain_Init.c:25: void InitSprites() {
;	---------------------------------
; Function InitSprites
; ---------------------------------
_InitSprites::
;ZGBMain_Init.c:26: INIT_SPRITE(SPRITE_PLAYER, player, 3, FRAME_16x16, 3);
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0302
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
;ZGBMain_Init.c:27: INIT_SPRITE(SPRITE_ENEMY, enemy, 3, FRAME_16x16, 1);
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0102
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
	ret
	.area _CODE_1
	.area _CABS (ABS)
