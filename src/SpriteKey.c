#pragma bank 2
#include "SpriteKey.h"
UINT8 bank_SPRITE_KEY = 2;
#include "Sound.h"
#include "SpriteManager.h"
#include "ZGBMain.h"
const UINT8 anim_key[] = { 6,0,1,2,3,4,5};
//const UINT8 anim_door[] = { 1,1 };

struct EnemyInfo {
	INT8 vy;
};

void Start_SPRITE_KEY() {
	
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	THIS->lim_x = 9999;
	THIS->lim_y = 9999;

	data->vy = 1;
}

void Update_SPRITE_KEY() {
	SetSpriteAnim(THIS, anim_key, 15);
}

void Destroy_SPRITE_KEY() {
	
	//SetState(STATE_MENU);
	
}
