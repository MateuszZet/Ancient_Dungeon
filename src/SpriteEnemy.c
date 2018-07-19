#pragma bank 2
#include "SpriteEnemy.h"
UINT8 bank_SPRITE_ENEMY = 2;
#include "Sound.h"
#include "SpriteManager.h"
#include "global.h"

const UINT8 anim_walk2[] = { 2,1,2 };
const UINT8 anim_walk[] = { 2,3,4 };

int dir=0;
int *dir_pointer = NULL;

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
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	dir_pointer = &dir;
	
	if(TranslateSprite(THIS, 0, data->vy)) {
		
		data->vy = -data->vy;
		
		PlayFx(CHANNEL_4, 4, 0x0c, 0x41, 0x30, 0xc0);
		if (dir == 0 ) {
			SetSpriteAnim(THIS, anim_walk, 15);
			*dir_pointer = 1;
		}
		else {
			SetSpriteAnim(THIS, anim_walk2, 15);
			*dir_pointer = 0;
		}
		
	}
	
}


void Destroy_SPRITE_ENEMY() {
}