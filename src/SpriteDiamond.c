#pragma bank 2
#include "SpriteDiamond.h"
UINT8 bank_SPRITE_DIAMOND = 2;
#include "Sound.h"
#include "SpriteManager.h"
#include "ZGBMain.h"

const UINT8 anim_diamond[] = {5,0,1,2,3,4};

struct EnemyInfo {
	INT8 vy;
};

void Start_SPRITE_DIAMOND() {
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	THIS->lim_x = 9999;
	THIS->lim_y = 9999;
	data->vy = 1;
	SetSpriteAnim(THIS, anim_diamond, 20);
}

void Update_SPRITE_DIAMOND() {
	
}

void Destroy_SPRITE_DIAMOND() {
	//SetState(STATE_MENU);
}
