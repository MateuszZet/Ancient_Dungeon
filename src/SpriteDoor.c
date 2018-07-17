#pragma bank 2
#include "SpriteDoor.h"
UINT8 bank_SPRITE_DOOR = 2;
#include "Sound.h"
#include "SpriteManager.h"



struct EnemyInfo {
	INT8 vy;
};

void Start_SPRITE_DOOR() {
	struct EnemyInfo* data = (struct EnemyInfo*)THIS->custom_data;
	THIS->lim_x = 9999;
	THIS->lim_y = 9999;

	data->vy = 1;
}

void Update_SPRITE_DOOR() {
	
}

void Destroy_SPRITE_DOOR() {

}
