#pragma bank 2
#include "StateGame.h"
UINT8 bank_STATE_GAME = 2;
#include <stdio.h>
#include "..\res\src\tiles.h"
#include "..\res\src\map.h"
#include "Keys.h"
#include "ZGBMain.h"
#include "Scroll.h"
#include "SpriteManager.h"
#include "Print.h"
#include "global.h"

extern UINT8 n_sprite_types;
UINT8 collilision_tiles[] = { 1,2,3,4,0 };

void Start_STATE_GAME() {
	UINT8 i;
	next_lvl=2;
	NR52_REG = 0x80; //Enables sound, you should always setup this first
	NR51_REG = 0xFF; //Enables all channels (left and right)
	NR50_REG = 0x77; //Max volume
	
	SPRITES_8x16;
	for(i = 0; i != n_sprite_types; ++ i) {
		SpriteManagerLoad(i);
	}
	SHOW_SPRITES;

	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 20, 100);
	
	door_x = 240;
	door_y = 112;
	SpriteManagerAdd(SPRITE_KEY, 288, 112);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);

	SpriteManagerAdd(SPRITE_ENEMY, 40, 32);
	SpriteManagerAdd(SPRITE_ENEMY, 128, 80);
	SpriteManagerAdd(SPRITE_ENEMY, 200, 112);
	SpriteManagerAdd(SPRITE_ENEMY, 288, 96);
	
	InitScrollTiles(0, 59, tiles, 3);
	InitScroll(mapWidth, mapHeight, map, collilision_tiles, 0, 3);
	SHOW_BKG;

	
}

void Update_STATE_GAME() {
	if (KEY_PRESSED(J_START)) {
		SetState(STATE_GAME2);
	}
}
