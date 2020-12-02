#pragma bank 2
#include "StateGame4.h"
UINT8 bank_STATE_GAME4 = 2;
#include <stdio.h>
#include "..\res\src\tiles.h"
#include "..\res\src\map4.h"
#include "Keys.h"
#include "ZGBMain.h"
#include "Scroll.h"
#include "SpriteManager.h"
#include "global.h"

extern UINT8 n_sprite_types;
UINT8 collilision_tiles4[] = { 1,2,3,4,0 };

void Start_STATE_GAME4() {
	UINT8 i;
	next_lvl=5;
	NR52_REG = 0x80; //Enables sound, you should always setup this first
	NR51_REG = 0xFF; //Enables all channels (left and right)
	NR50_REG = 0x77; //Max volume
	
	SPRITES_8x16;
	for(i = 0; i != n_sprite_types; ++ i) {
		SpriteManagerLoad(i);
	}
	SHOW_SPRITES;

	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 200, 200);
	
	have_bomb=2;
	
	door_x = 343;
	door_y = 343;
	SpriteManagerAdd(SPRITE_KEY, 38, 38);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
	
	
	SpriteManagerAdd(SPRITE_ENEMY3, 352, 190);
	SpriteManagerAdd(SPRITE_ENEMY3, 88, 144);
	SpriteManagerAdd(SPRITE_ENEMY2, 272, 112);
	SpriteManagerAdd(SPRITE_ENEMY, 94, 280);
	SpriteManagerAdd(SPRITE_ENEMY, 272, 112);
	SpriteManagerAdd(SPRITE_ENEMY2, 94, 280);
	SpriteManagerAdd(SPRITE_ENEMY2, 312, 344);
	
	InitScrollTiles(0, 59, tiles, 3);
	InitScroll(map4Width, map4Height, map4, collilision_tiles4, 0, 3);
	SHOW_BKG;

	
}

void Update_STATE_GAME4() {
	if (KEY_PRESSED(J_START)) {
		SetState(STATE_GAME5);
	}
}