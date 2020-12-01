#pragma bank 2
#include "StateEnd2.h"
UINT8 bank_STATE_END2 = 2;
#include <stdio.h>
#include "..\res\src\tiles.h"
#include "..\res\src\end.h"
#include "Keys.h"
#include "ZGBMain.h"
#include "Scroll.h"
#include "SpriteManager.h"
#include "global.h"
extern UINT8 n_sprite_types;
UINT8 collilision_tiles4[] = { 1,2,3,4,0 };

void Start_STATE_END2() {
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
	
	SpriteManagerAdd(SPRITE_DIAMOND, 80, 72);
	SpriteManagerAdd(SPRITE_DIAMOND, 64, 72);
	
	SpriteManagerAdd(SPRITE_DIAMOND, 128, 112);
	SpriteManagerAdd(SPRITE_DIAMOND, 112, 96);
	SpriteManagerAdd(SPRITE_DIAMOND, 96, 80);
	
	SpriteManagerAdd(SPRITE_DIAMOND, 16, 112);
	SpriteManagerAdd(SPRITE_DIAMOND, 32, 96);
	SpriteManagerAdd(SPRITE_DIAMOND, 48, 80);
	
	InitScrollTiles(0, 59, tiles, 3);
	InitScroll(endWidth,endHeight,end, collilision_tiles4, 0, 3);
	SHOW_BKG;

	
}

void Update_STATE_END2() {
	if(have_diamond==9){
		SetState(STATE_MENU);
	}
}