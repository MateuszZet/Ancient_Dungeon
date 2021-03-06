#pragma bank 2
#include "SpritePlayer.h"
#include "Keys.h"
#include "SpriteManager.h"
#include "ZGBMain.h"
#include "Sound.h"
#include "global.h"
const UINT8 anim_idle[] = {1,0};
const UINT8 anim_down[] = {2,1,2};
const UINT8 anim_right[] = { 2,3,4 };
const UINT8 anim_left[] = { 2,5,6 };
const UINT8 anim_up[] = { 2,7,8 };

UINT8 bank_SPRITE_PLAYER = 2;

int door_x;
int door_y;
int next_lvl;
int have_bomb;
int have_diamond;
int direction_x;

void Start_SPRITE_PLAYER() {
	THIS->coll_x = 1;
	THIS->coll_y = 0;
	THIS->coll_w = 13;
	THIS->coll_h = 16;
}

void Update_SPRITE_PLAYER() {
	UINT8 i;
	struct Sprite* spr;
	
	//controls
	if(KEY_PRESSED(J_UP)){
		THIS->y--;
		SetSpriteAnim(THIS, anim_up, 10);
		TranslateSprite(THIS, 0, -1 << delta_time);
	}
	if(KEY_PRESSED(J_DOWN)){
		THIS->y++;
		SetSpriteAnim(THIS, anim_down, 10);
		TranslateSprite(THIS, 0, 1 << delta_time);
	}
	if(KEY_PRESSED(J_RIGHT)){
		THIS->x++;
		SetSpriteAnim(THIS, anim_right, 10);
		TranslateSprite(THIS, 1 << delta_time, 0);
		direction_x = 1;
		
	}
	if(KEY_PRESSED(J_LEFT)){
		THIS->x--;
		SetSpriteAnim(THIS, anim_left, 10);
		TranslateSprite(THIS, -1 << delta_time, 0);
		direction_x = 0;

	}
	if(keys == 0){
		SetSpriteAnim(THIS, anim_idle, 20);
	}
	if (KEY_TICKED(J_A) && have_bomb>0 ) {
			SpriteManagerAdd(SPRITE_BOMB, THIS->x + 20, THIS->y);
			have_bomb--;
			PlayFx(CHANNEL_1, 10, 0x38, 0x70, 0xe0, 0x0a, 0xc6);
		
	}
	if (KEY_TICKED(J_B) && have_bomb>0) {
		SpriteManagerAdd(SPRITE_BOMB_L, THIS->x - 20, THIS->y);
		have_bomb--;
		PlayFx(CHANNEL_1, 10, 0x38, 0x70, 0xe0, 0x0a, 0xc6);

	}
	
	
	//collision with objects
	SPRITEMANAGER_ITERATE(i, spr) {
		if(spr->type == SPRITE_ENEMY) {
			if(CheckCollision(THIS, spr)) {
				SetState(STATE_MENU);
				PlayFx(CHANNEL_1, 10, 0x4f, 0xc7, 0xf3, 0x73, 0x86);
				
			}
		}
		if(spr->type == SPRITE_ENEMY2) {
			if(CheckCollision(THIS, spr)) {
				SetState(STATE_MENU);
				PlayFx(CHANNEL_1, 10, 0x4f, 0xc7, 0xf3, 0x73, 0x86);
			}
		}
		if(spr->type == SPRITE_ENEMY3) {
			if(CheckCollision(THIS, spr)) {
				SetState(STATE_MENU);
				PlayFx(CHANNEL_1, 10, 0x4f, 0xc7, 0xf3, 0x73, 0x86);
			}
		}
		if (spr->type == SPRITE_BOMB) {
			if (CheckCollision(THIS, spr)) {
				SetState(STATE_MENU);
				PlayFx(CHANNEL_1, 10, 0x4f, 0xc7, 0xf3, 0x73, 0x86);
			}
		}
		if (spr->type == SPRITE_BOMB_L) {
			if (CheckCollision(THIS, spr)) {
				SetState(STATE_MENU);
				PlayFx(CHANNEL_1, 10, 0x4f, 0xc7, 0xf3, 0x73, 0x86);
			}
		}
		if (spr->type == SPRITE_KEY) {
			if (CheckCollision(THIS, spr)) {
				SpriteManagerRemoveSprite(spr);
				SpriteManagerRemove(2); //need to place door always as 2 (second sprite)
				SpriteManagerAdd(SPRITE_DOOROPEN, door_x, door_y);
				PlayFx(CHANNEL_1, 10, 0x4U, 0xFEU, 0xA1U, 0x8FU, 0x86U);
			}
		}
		if (spr->type == SPRITE_DIAMOND) {
			if (CheckCollision(THIS, spr)) {
				SpriteManagerRemoveSprite(spr);
				PlayFx(CHANNEL_1, 10, 0x4U, 0xFEU, 0xA1U, 0x8FU, 0x86U);
				have_diamond++;
			}
		}
		if (spr->type == SPRITE_DOOROPEN) {
			if (CheckCollision(THIS, spr)) {
				SetState(next_lvl);
			}
		}
	}
}

void Destroy_SPRITE_PLAYER() {
}

