#pragma bank 2
#include "StateMenu.h"
UINT8 bank_STATE_MENU = 2;
#include <stdio.h>
#include "..\res\src\tiles.h"
#include "..\res\src\menu.h"
#include "Keys.h"
#include "ZGBMain.h"
#include "Scroll.h"
#include "SpriteManager.h"
#include "Print.h"
#include "global.h"
extern UINT8 n_sprite_types;
UINT8 collilision_tiles0[] = { 1,2,3,4,0 };

void Start_STATE_MENU() {
	UINT8 i;
	next_lvl =1;
	NR52_REG = 0x80; //Enables sound, you should always setup this first
	NR51_REG = 0xFF; //Enables all channels (left and right)
	NR50_REG = 0x77; //Max volume
	
	SPRITES_8x16;
	for(i = 0; i != n_sprite_types; ++ i) {
		SpriteManagerLoad(i);
	}
	SHOW_SPRITES;
	
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 70, 35);
	door_x = 20;
	door_y = 120;
	have_bomb = 6;
	SpriteManagerAdd(SPRITE_KEY, 20, 20);
	SpriteManagerAdd(SPRITE_DOOR,door_x, door_y);
	SpriteManagerAdd(SPRITE_ENEMY, 128, 112);
	SpriteManagerAdd(SPRITE_ENEMY2, 50, 115 );
	SpriteManagerAdd(SPRITE_ENEMY3, 30, 30);
	SpriteManagerAdd(SPRITE_DIAMOND, 128, 112);
	InitScrollTiles(0, 59, tiles, 3);
	InitScroll(menuWidth,menuHeight,menu, collilision_tiles0, 0, 3);
	SHOW_BKG;

	
}

void Update_STATE_MENU() {
	if (KEY_PRESSED(J_START)) {
		SetState(STATE_GAME5);
	}
}