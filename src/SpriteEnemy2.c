#pragma bank 2
#include "SpriteEnemy2.h"
UINT8 bank_SPRITE_ENEMY2 = 2;
#include "Sound.h"
#include "SpriteManager.h"
#include "global.h"
#include "ZGBMain.h"

const UINT8 anime_left[] = { 3,0,1,2 };
const UINT8 anime_right[] = { 3,3,4,5 };

struct EnemyInfo {
	INT8 vx;
};

void Start_SPRITE_ENEMY2() {
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	THIS->lim_x=9999;
	THIS->lim_y=9999;
	data->vx = 1;
	
	SetSpriteAnim(THIS, anime_right, 15);
	
}

void Update_SPRITE_ENEMY2() {
	UINT8 i;
	struct Sprite* spr;
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	
	if(TranslateSprite(THIS, data->vx << delta_time,0)) {
		
		data->vx = -data->vx;
		
		PlayFx(CHANNEL_4, 4, 0x0c, 0x41, 0x30, 0xc0);
		if (data->vx == -1 ) {
			SetSpriteAnim(THIS, anime_left, 15);
		}
		else {
			SetSpriteAnim(THIS, anime_right, 15);
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

void Destroy_SPRITE_ENEMY2() {
}