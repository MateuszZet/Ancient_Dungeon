#pragma bank 2
#include "SpriteBomb.h"
UINT8 bank_SPRITE_BOMB = 2;
#include "Sound.h"
#include "SpriteManager.h"
#include "ZGBMain.h"
#include "Keys.h"
const UINT8 anim_bomb[] = { 7,0,1,2,3,4,5,6};

struct EnemyInfo {
	INT8 vy;
};

void Start_SPRITE_BOMB() {
	UINT8 i;
	struct Sprite* spr;
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	THIS->lim_x = 9999;
	THIS->lim_y = 9999;

	data->vy = 1;
	SetSpriteAnim(THIS, anim_bomb, 5);

}

void Update_SPRITE_BOMB() {
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
		TranslateSprite(THIS, 0, data->vy);
	
	
}

void Destroy_SPRITE_BOMB() {
	
	//SetState(STATE_MENU);
	
}