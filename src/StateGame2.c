#pragma bank 2
#include "StateGame2.h"
UINT8 bank_STATE_GAME2 = 2;
#include <stdio.h>
#include "..\res\src\tiles.h"
#include "..\res\src\map2.h"
#include "Keys.h"
#include "ZGBMain.h"
#include "Scroll.h"
#include "SpriteManager.h"
#include "global.h"

extern UINT8 n_sprite_types;
UINT8 collilision_tiles2[] = { 1,2,3,4,0 };

void Start_STATE_GAME2() {
	UINT8 i;
	next_lvl=3;
	NR52_REG = 0x80; //Enables sound, you should always setup this first
	NR51_REG = 0xFF; //Enables all channels (left and right)
	NR50_REG = 0x77; //Max volume
	
	SPRITES_8x16;
	for(i = 0; i != n_sprite_types; ++ i) {
		SpriteManagerLoad(i);
	}
	SHOW_SPRITES;
	
	have_bomb=2;
	
	if( have_diamond == 0){
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 20, 100);
	door_x = 16;
	door_y = 24;
	SpriteManagerAdd(SPRITE_KEY, 168, 88);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);

	SpriteManagerAdd(SPRITE_ENEMY2, 50, 115 );
	SpriteManagerAdd(SPRITE_ENEMY2, 24, 64 );

	SpriteManagerAdd(SPRITE_ENEMY, 88, 104);
	SpriteManagerAdd(SPRITE_ENEMY, 224, 48);
	SpriteManagerAdd(SPRITE_ENEMY, 288, 40);
	}
	
	if( have_diamond == 1 ){
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 20, 100);
	door_x = 175;
	door_y = 85;
	SpriteManagerAdd(SPRITE_KEY, 50, 24);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);

	SpriteManagerAdd(SPRITE_ENEMY2, 24, 64 );

	SpriteManagerAdd(SPRITE_ENEMY, 88, 104);
	SpriteManagerAdd(SPRITE_ENEMY, 224, 48);
	SpriteManagerAdd(SPRITE_ENEMY, 288, 40);
	SpriteManagerAdd(SPRITE_ENEMY3, 50, 50);
	}
	
	if( have_diamond == 3 ){
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 175, 84);
	door_x = 210;
	door_y = 55;
	SpriteManagerAdd(SPRITE_KEY, 16, 24);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);

	SpriteManagerAdd(SPRITE_ENEMY2, 24, 64 );

	SpriteManagerAdd(SPRITE_ENEMY3, 88, 104);
	SpriteManagerAdd(SPRITE_ENEMY, 224, 48);
	SpriteManagerAdd(SPRITE_ENEMY3, 50, 50);	
	}
	
	if( have_diamond == 6 ){
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 175, 84);
	door_x = 288;
	door_y = 115;
	SpriteManagerAdd(SPRITE_KEY, 16, 24);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);

	SpriteManagerAdd(SPRITE_ENEMY2, 24, 80 );
	SpriteManagerAdd(SPRITE_ENEMY, 88, 104);
	SpriteManagerAdd(SPRITE_ENEMY3, 88, 104);
	SpriteManagerAdd(SPRITE_ENEMY, 288, 40);

	SpriteManagerAdd(SPRITE_ENEMY3, 50, 50);	
	}
	
	if( have_diamond == 10 ){
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 20, 100);
	door_x = 16;
	door_y = 24;
	SpriteManagerAdd(SPRITE_KEY, 245, 84);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
	SpriteManagerAdd(SPRITE_ENEMY2, 24, 64 );
	SpriteManagerAdd(SPRITE_ENEMY2, 175, 84 );
	SpriteManagerAdd(SPRITE_ENEMY, 88, 104);
	SpriteManagerAdd(SPRITE_ENEMY3, 88, 104);

		
	}
	
	InitScrollTiles(0, 59, tiles, 3);
	InitScroll(map2Width, map2Height, map2, collilision_tiles2, 0, 3);
	SHOW_BKG;

	
}

void Update_STATE_GAME2() {
	
}
