#pragma bank 2
#include "StateGame5.h"
UINT8 bank_STATE_GAME5 = 2;
#include <stdio.h>
#include "..\res\src\tiles.h"
#include "..\res\src\map5.h"
#include "Keys.h"
#include "ZGBMain.h"
#include "Scroll.h"
#include "SpriteManager.h"
#include "global.h"

extern UINT8 n_sprite_types;
UINT8 collilision_tiles5[] = { 1,2,3,4,0 };

void Start_STATE_GAME5() {
	UINT8 i;
	next_lvl=6;
	NR52_REG = 0x80; //Enables sound, you should always setup this first
	NR51_REG = 0xFF; //Enables all channels (left and right)
	NR50_REG = 0x77; //Max volume
	
	SPRITES_8x16;
	for(i = 0; i != n_sprite_types; ++ i) {
		SpriteManagerLoad(i);
	}
	SHOW_SPRITES;

	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 24, 24);
	
	if( have_diamond == 1){
		have_bomb=0;
	}
	else{
		have_bomb = 1;
	}
	
	door_x = 186;
	door_y = 176;
	SpriteManagerAdd(SPRITE_KEY, 416, 120);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
	
	SpriteManagerAdd(SPRITE_ENEMY, 96, 72);
	SpriteManagerAdd(SPRITE_ENEMY, 272, 72);
	SpriteManagerAdd(SPRITE_ENEMY, 352, 65);
	SpriteManagerAdd(SPRITE_ENEMY, 178, 65);
	SpriteManagerAdd(SPRITE_ENEMY2, 186, 170);
	
	InitScrollTiles(0, 59, tiles, 3);
	InitScroll(map5Width, map5Height, map5, collilision_tiles5, 0, 3);
	SHOW_BKG;

	
}

void Update_STATE_GAME5() {
	if (KEY_PRESSED(J_START)) {
		SetState(STATE_GAME6);
	}
}