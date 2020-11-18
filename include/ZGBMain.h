#ifndef ZGBMAIN_H
#define ZGBMAIN_H

#include "main.h"

typedef enum {
	STATE_MENU,
	STATE_GAME,
	STATE_GAME2,
	STATE_GAME3,
	STATE_GAME4,
	STATE_GAME5,
	STATE_END,

	N_STATES
} STATE;

typedef enum {
	SPRITE_PLAYER,
	SPRITE_ENEMY,
	SPRITE_ENEMY2,
	SPRITE_KEY,
	SPRITE_DOOR,
	SPRITE_DOOROPEN,
	SPRITE_BOMB,
	SPRITE_BOMB_L,
	SPRITE_ENEMY3,
	SPRITE_DIAMOND,
	
	N_SPRITE_TYPES
} SPRITE_TYPE;

#endif