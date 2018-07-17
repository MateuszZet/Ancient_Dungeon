#pragma bank 2
#include "SpriteDoorOpen.h"
UINT8 bank_SPRITE_DOOROPEN = 2;
#include "Sound.h"
#include "SpriteManager.h"


struct EnemyInfo {
	INT8 vy;
};

void Start_SPRITE_DOOROPEN() {
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	THIS->lim_x = 9999;
	THIS->lim_y = 9999;

	data->vy = 1;
}

void Update_SPRITE_DOOROPEN() {
	
}

void Destroy_SPRITE_DOOROPEN() {

}
