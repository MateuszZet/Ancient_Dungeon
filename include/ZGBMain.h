#ifndef ZGBMAIN_H
#define ZGBMAIN_H

#include "main.h"

typedef enum {
	STATE_MENU,
	STATE_GAME,
	STATE_GAME2,

	N_STATES
} STATE;

typedef enum {
	SPRITE_PLAYER,
	SPRITE_ENEMY,
	SPRITE_ENEMY2,
	SPRITE_KEY,
	SPRITE_DOOR,
	SPRITE_DOOROPEN,
	
	N_SPRITE_TYPES
} SPRITE_TYPE;

#endif