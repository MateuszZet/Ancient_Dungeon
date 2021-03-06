#pragma bank 2
#include "SpriteEnemy.h"
UINT8 bank_SPRITE_ENEMY = 2;
#include "Sound.h"
#include "SpriteManager.h"
#include "global.h"
#include "ZGBMain.h"

const UINT8 anim_walk2[] = { 2,1,2 };
const UINT8 anim_walk[] = { 2,3,4 };


struct EnemyInfo {
	INT8 vy;
};

void Start_SPRITE_ENEMY() {
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	THIS->lim_x=9999;
	THIS->lim_y=9999;
	data->vy = 1;
	
	SetSpriteAnim(THIS, anim_walk2, 15);
	
}

void Update_SPRITE_ENEMY() {
	
	UINT8 i;
	struct Sprite* spr;
	
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;

	if (TranslateSprite(THIS, 0 << delta_time, data->vy << delta_time)) {

		data->vy = -data->vy;

		PlayFx(CHANNEL_4, 4, 0x0c, 0x41, 0x30, 0xc0);
		if (data->vy == -1) {
			SetSpriteAnim(THIS, anim_walk, 15);
		}
		else {
			SetSpriteAnim(THIS, anim_walk2, 15);
		}

	}

	//collision with objects
	SPRITEMANAGER_ITERATE(i, spr) {
		if (spr->type == SPRITE_BOMB || spr->type == SPRITE_BOMB_L) {
			if (CheckCollision(THIS, spr)) {
				SpriteManagerRemoveSprite(THIS);
				PlayFx(CHANNEL_1, 10, 0x1e, 0x10, 0xf3, 0x00, 0x87);
				SpriteManagerRemoveSprite(spr);
			}
		}

	}
}

void Destroy_SPRITE_ENEMY() {
}