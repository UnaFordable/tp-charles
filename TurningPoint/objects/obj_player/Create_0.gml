/// @description Insert description here
// You can write your code in this editor
spd_walk = 2;
anim_index = 0;

_savedface_x = 0;
_savedface_y = 0;

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

key_action = keyboard_check_pressed(ord("Z"));
key_back = keyboard_check_pressed(ord("X"));

function four_direction_animate() {
	//Update Sprite
	var _anim_length = sprite_get_number(sprite_index) / 4;
	image_index = anim_index + (((direction div 90) mod 4) * _anim_length);
	anim_index += sprite_get_speed(sprite_index) / 60;

	//If animation would loop on next game step
	if (anim_index >= _anim_length)
	{
		animation_end = true;	
		anim_index -= _anim_length;
	}else animation_end = false;
}

