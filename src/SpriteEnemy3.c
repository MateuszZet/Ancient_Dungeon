#pragma bank 2
#include "SpriteEnemy3.h"
UINT8 bank_SPRITE_ENEMY3 = 2;
#include "Sound.h"
#include "SpriteManager.h"
#include "global.h"
#include "ZGBMain.h"

const UINT8 anime[] = { 3,0,1,2 };

int dir = 0;
int *dir_pointer = NULL;

struct EnemyInfo {
	INT8 vx;
	INT8 vy;
};

void Start_SPRITE_ENEMY3() {
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	THIS->lim_x=9999;
	THIS->lim_y=9999;
	data->vx = 1;
	data->vy = 1;
	
	SetSpriteAnim(THIS, anime, 15);
	
}

void Update_SPRITE_ENEMY3() {
	UINT8 i;
	struct Sprite* spr;
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	dir_pointer = &dir;

	if(TranslateSprite(THIS, data->vx << delta_time, data->vy << delta_time)) {
		
		if (*dir_pointer == 0) {
			//data->vx = 0;
			data->vy = -data->vy;
			*dir_pointer = 1;
		}
		else {
			data->vx = -data->vx;
			//data->vy = -data->vy;
			*dir_pointer = 0;
		}
		
	}

	
}

void Destroy_SPRITE_ENEMY3() {
}