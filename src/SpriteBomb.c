#pragma bank 2
#include "SpriteBomb.h"
UINT8 bank_SPRITE_BOMB = 2;
#include "Sound.h"
#include "SpriteManager.h"
#include "ZGBMain.h"
#include "Keys.h"
const UINT8 anim_bomb[] = { 4,0,1,2,3};


struct EnemyInfo {
	INT8 vy;
	INT8 vx;
};


void Start_SPRITE_BOMB() {
	UINT8 i;
	struct Sprite* spr;
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	
	THIS->lim_x = 9999;
	THIS->lim_y = 9999;

	data->vy = 2;
	data->vx = 2;

	SetSpriteAnim(THIS, anim_bomb, 15);

}


void Update_SPRITE_BOMB() {
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	TranslateSprite(THIS, data->vx << delta_time, 0);

}

void Destroy_SPRITE_BOMB() {

	//SetState(STATE_MENU);

}

