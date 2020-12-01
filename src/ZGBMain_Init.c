#pragma bank 2
#include "ZGBMain.h"
UINT8 init_bank = 2;



#include "StateMenu.h"
#include "StateGame.h"
#include "StateGame2.h"
#include "StateGame3.h"
#include "StateGame4.h"
#include "StateGame5.h"
#include "StateGame6.h"
#include "StateEnd.h"
#include "StateEnd2.h"

#include "SpritePlayer.h"
#include "../res/src/player.h"

#include "SpriteEnemy.h"
#include "../res/src/enemy.h"

#include "SpriteEnemy3.h"
#include "../res/src/enemy3.h"



#include "SpriteKey.h"
#include "../res/src/key.h"

#include "SpriteDoor.h"
#include "../res/src/door.h"

#include "SpriteDoorOpen.h"
#include "../res/src/dooropen.h"

#include "SpriteEnemy2.h"
#include "../res/src/enemy2.h"

#include "SpriteBomb.h"
#include "../res/src/bomb.h"

#include "SpriteBomb_L.h"
#include "../res/src/bomb.h"

#include "SpriteDiamond.h"
#include "../res/src/diamond.h"

UINT8 next_state = STATE_MENU;

SET_N_STATES(N_STATES);
SET_N_SPRITE_TYPES(N_SPRITE_TYPES);

void InitStates() {
	INIT_STATE(STATE_MENU);
	INIT_STATE(STATE_GAME);
	INIT_STATE(STATE_GAME2);
	INIT_STATE(STATE_GAME3);
	INIT_STATE(STATE_GAME4);
	INIT_STATE(STATE_GAME5);
	INIT_STATE(STATE_GAME6);
	INIT_STATE(STATE_END);
	INIT_STATE(STATE_END2);
}

void InitSprites() {
	INIT_SPRITE(SPRITE_PLAYER, player, 3, FRAME_16x16, 9);
	INIT_SPRITE(SPRITE_ENEMY, enemy, 3, FRAME_16x16, 5);
	
	INIT_SPRITE(SPRITE_KEY, key, 3, FRAME_16x16, 6);
	INIT_SPRITE(SPRITE_DOOR, door, 3, FRAME_16x16, 1);
	INIT_SPRITE(SPRITE_DOOROPEN, dooropen, 3, FRAME_16x16, 1);
	INIT_SPRITE(SPRITE_ENEMY2, enemy2, 3, FRAME_16x16, 6);
	INIT_SPRITE(SPRITE_BOMB, bomb, 3, FRAME_16x16, 4);
	INIT_SPRITE(SPRITE_BOMB_L, bomb, 3, FRAME_16x16, 8);
	INIT_SPRITE(SPRITE_ENEMY3, enemy3, 3, FRAME_16x16, 4);
	INIT_SPRITE(SPRITE_DIAMOND, diamond, 3, FRAME_16x16, 5);
}
