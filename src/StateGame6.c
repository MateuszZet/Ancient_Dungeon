#pragma bank 2
#include "StateGame6.h"
UINT8 bank_STATE_GAME6 = 2;
#include <stdio.h>
#include "..\res\src\tiles.h"
#include "..\res\src\map6.h"
#include "Keys.h"
#include "ZGBMain.h"
#include "Scroll.h"
#include "SpriteManager.h"
#include "global.h"

extern UINT8 n_sprite_types;
UINT8 collilision_tiles6[] = { 1,2,3,4,0 };

void Start_STATE_GAME6() {
	UINT8 i;
	
	if(have_diamond == 0 || have_diamond == 3 || have_diamond == 10){
		next_lvl=7;
	}
	else{
		next_lvl=8;
	}
		
	
	NR52_REG = 0x80; //Enables sound, you should always setup this first
	NR51_REG = 0xFF; //Enables all channels (left and right)
	NR50_REG = 0x77; //Max volume
	
	SPRITES_8x16;
	for(i = 0; i != n_sprite_types; ++ i) {
		SpriteManagerLoad(i);
	}
	SHOW_SPRITES;
	
	have_bomb=2;
	
	if( have_diamond == 0 ){
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 20, 100);
	door_x = 88;
	door_y = 120;
	SpriteManagerAdd(SPRITE_KEY, 88, 16);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
	
	SpriteManagerAdd(SPRITE_ENEMY, 128, 112);
	SpriteManagerAdd(SPRITE_ENEMY, 270, 112);
	SpriteManagerAdd(SPRITE_ENEMY2, 128, 224);
	}
	
	if( have_diamond == 1 ){
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 20, 16);
	door_x = 88;
	door_y = 16;
	SpriteManagerAdd(SPRITE_KEY, 88, 120);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
	
	SpriteManagerAdd(SPRITE_ENEMY2, 128, 69);
	SpriteManagerAdd(SPRITE_ENEMY, 64, 120);
	SpriteManagerAdd(SPRITE_ENEMY, 128, 112);
	SpriteManagerAdd(SPRITE_ENEMY2, 128, 224);
	}
	
	if( have_diamond == 3 ){
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 20, 120);
	door_x = 88;
	door_y = 16;
	SpriteManagerAdd(SPRITE_KEY, 88, 120);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
	
	SpriteManagerAdd(SPRITE_ENEMY2, 128, 78);
	SpriteManagerAdd(SPRITE_ENEMY, 270, 112);
	SpriteManagerAdd(SPRITE_ENEMY, 70, 120);	
	}
	
	if( have_diamond == 6 ){
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 72, 16);
	door_x = 88;
	door_y = 120;
	SpriteManagerAdd(SPRITE_KEY, 20, 44);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
	
	SpriteManagerAdd(SPRITE_ENEMY, 128, 112);
	SpriteManagerAdd(SPRITE_ENEMY, 20, 100);
	SpriteManagerAdd(SPRITE_ENEMY2, 128, 224);	
	SpriteManagerAdd(SPRITE_ENEMY2, 128, 69);
	}
	
	if( have_diamond == 10 ){
	scroll_target = SpriteManagerAdd(SPRITE_PLAYER, 20, 120);
	door_x = 88;
	door_y = 120;
	SpriteManagerAdd(SPRITE_KEY, 20, 16);
	SpriteManagerAdd(SPRITE_DOOR, door_x, door_y);
	SpriteManagerAdd(SPRITE_ENEMY, 72, 16);
	SpriteManagerAdd(SPRITE_ENEMY, 128, 112);
	SpriteManagerAdd(SPRITE_ENEMY, 270, 112);
	SpriteManagerAdd(SPRITE_ENEMY, 70, 120);	
	}
	
	InitScrollTiles(0, 59, tiles, 3);
	InitScroll(map6Width, map6Height, map6, collilision_tiles6, 0, 3);
	SHOW_BKG;

	
}

void Update_STATE_GAME6() {
	
}