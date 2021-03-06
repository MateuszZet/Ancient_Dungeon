#pragma bank 2
#include "StateGame3.h"
UINT8 bank_STATE_GAME3 = 2;
#include <stdio.h>
#include "..\res\src\tiles.h"
#include "..\res\src\map3.h"
#include "Keys.h"
#include "ZGBMain.h"
#include "Scroll.h"
#include "SpriteManager.h"
#include "global.h"

extern UINT8 n_sprite_types;
UINT8 collilision_tiles3[] = { 1,2,3,4,0 };

void Start_STATE_GAME3() {
	UINT8 i;
	next_lvl=4;
	NR52_REG = 0x80; //Enables sound, you should always setup this first
	NR51_REG = 0xFF; //Enables all channels (left and right)
	NR50_REG = 0x77; //Max volume
	
	SPRITES_8x16;
	for(i = 0; i != n_sprite_types; ++ i) {
		SpriteManagerLoad(i);
	}
	SHOW_SPRITES;

	have_bomb=2;
	
	if( have_diamond== 0 ){
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 24, 24);
	door_x = 104;
	door_y = 344;
	SpriteManagerAdd(SPRITE_KEY, 120, 408);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
	
	SpriteManagerAdd(SPRITE_ENEMY2, 16, 312 );
	SpriteManagerAdd(SPRITE_ENEMY2, 16, 88 );
	SpriteManagerAdd(SPRITE_ENEMY2, 32, 408 );

	SpriteManagerAdd(SPRITE_ENEMY, 120, 24);
	SpriteManagerAdd(SPRITE_ENEMY, 120, 216);
	SpriteManagerAdd(SPRITE_ENEMY, 32, 400);
	SpriteManagerAdd(SPRITE_ENEMY3, 30, 60);
	}
	
	if( have_diamond == 1 ){
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 24, 24);
	door_x = 120;
	door_y = 408;
	SpriteManagerAdd(SPRITE_KEY, 30, 208);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);

	SpriteManagerAdd(SPRITE_ENEMY, 90, 24);
	SpriteManagerAdd(SPRITE_ENEMY2, 32, 408 );
	SpriteManagerAdd(SPRITE_ENEMY, 32, 400);
	SpriteManagerAdd(SPRITE_ENEMY, 120, 216);
	}
	
	if( have_diamond == 3 ){
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 120, 408);
	door_x = 30;
	door_y = 208;
	SpriteManagerAdd(SPRITE_KEY, 32, 250);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
	
	SpriteManagerAdd(SPRITE_ENEMY, 24, 24);
	SpriteManagerAdd(SPRITE_ENEMY2, 16, 312 );
	SpriteManagerAdd(SPRITE_ENEMY2, 16, 88 );
	SpriteManagerAdd(SPRITE_ENEMY, 32, 400);
	}
	
	if( have_diamond == 6 ){
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 120, 216);
	door_x = 30;
	door_y = 208;
	SpriteManagerAdd(SPRITE_KEY, 120, 408);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
	
	SpriteManagerAdd(SPRITE_ENEMY2, 32, 408 );
	SpriteManagerAdd(SPRITE_ENEMY2, 16, 312 );
	SpriteManagerAdd(SPRITE_ENEMY3, 30, 60);
	SpriteManagerAdd(SPRITE_ENEMY, 32, 400);
	SpriteManagerAdd(SPRITE_ENEMY3, 120, 24);
	SpriteManagerAdd(SPRITE_ENEMY2, 16, 88 );
	}
	
	if( have_diamond == 10 ){
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 30, 208);
	door_x = 120;
	door_y = 24;
	SpriteManagerAdd(SPRITE_KEY, 120, 408);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
	
	SpriteManagerAdd(SPRITE_ENEMY, 120, 24);
	SpriteManagerAdd(SPRITE_ENEMY2, 32, 380 );
	SpriteManagerAdd(SPRITE_ENEMY2, 16, 88 );
	SpriteManagerAdd(SPRITE_ENEMY2, 16, 312 );
	SpriteManagerAdd(SPRITE_ENEMY3, 32, 400);
	}
	
	InitScrollTiles(0, 59, tiles, 3);
	InitScroll(map3Width, map3Height, map3, collilision_tiles3, 0, 3);
	SHOW_BKG;

	
}

void Update_STATE_GAME3() {
	
}