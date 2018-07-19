#pragma bank 1
#include "ZGBMain.h"
UINT8 init_bank = 1;


#include "StateGame.h"
#include "StateMenu.h"
#include "StateGame2.h"
#include "StateGame3.h"


#include "SpritePlayer.h"
#include "../res/src/player.h"

#include "SpriteEnemy.h"
#include "../res/src/enemy.h"



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

UINT8 next_state = STATE_MENU;

SET_N_STATES(N_STATES);
SET_N_SPRITE_TYPES(N_SPRITE_TYPES);

void InitStates() {
	INIT_STATE(STATE_MENU);
	INIT_STATE(STATE_GAME);
	INIT_STATE(STATE_GAME2);
	INIT_STATE(STATE_GAME3);
}

void InitSprites() {
	INIT_SPRITE(SPRITE_PLAYER, player, 3, FRAME_16x16, 9);
	INIT_SPRITE(SPRITE_ENEMY, enemy, 3, FRAME_16x16, 5);
	
	INIT_SPRITE(SPRITE_KEY, key, 3, FRAME_16x16, 6);
	INIT_SPRITE(SPRITE_DOOR, door, 3, FRAME_16x16, 1);
	INIT_SPRITE(SPRITE_DOOROPEN, dooropen, 3, FRAME_16x16, 1);
	INIT_SPRITE(SPRITE_ENEMY2, enemy2, 3, FRAME_16x16, 6);
	INIT_SPRITE(SPRITE_BOMB, bomb, 3, FRAME_16x16, 7);
}
