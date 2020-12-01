#pragma bank 2
#include "StateEnd.h"
UINT8 bank_STATE_END = 2;
#include <stdio.h>
#include "..\res\src\tiles.h"
#include "..\res\src\end.h"
#include "Keys.h"
#include "ZGBMain.h"
#include "Scroll.h"
#include "SpriteManager.h"
#include "Print.h"
#include "global.h"
extern UINT8 n_sprite_types;
UINT8 collilision_tiles4[] = { 1,2,3,4,0 };

void Start_STATE_END() {
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
	SpriteManagerAdd(SPRITE_DIAMOND, 72, 72);
	InitScrollTiles(0, 59, tiles, 3);
	InitScroll(endWidth,endHeight,end, collilision_tiles4, 0, 3);
	SHOW_BKG;

	
}

void Update_STATE_END() {
	
	if(have_diamond==1){
		SetState(STATE_MENU);
	}
	if (KEY_PRESSED(J_START)) {
		SetState(STATE_END2);
	}
}