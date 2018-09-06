#pragma bank 2
#include "SpriteBomb.h"
UINT8 bank_SPRITE_BOMB_L = 2;
#include "Sound.h"
#include "SpriteManager.h"
#include "ZGBMain.h"
#include "Keys.h"
const UINT8 anim_bomb[] = {4,4,5,6,7};


struct EnemyInfo {
	INT8 vy;
	INT8 vx;
};


void Start_SPRITE_BOMB_L() {
	UINT8 i;
	struct Sprite* spr;
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	
	THIS->lim_x = 9999;
	THIS->lim_y = 9999;

	data->vy = 2;
	data->vx = 2;

	SetSpriteAnim(THIS, anim_bomb, 15);

}


void Update_SPRITE_BOMB_L() {
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	TranslateSprite(THIS, -data->vx, 0);

}

void Destroy_SPRITE_BOMB_L() {

	//SetState(STATE_MENU);

}

