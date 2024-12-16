/// @description Insert description here
// You can write your code in this editor
depth = -y;
if(!instance_exists(obj_dialogue)){
 key_left = keyboard_check(vk_left);
 key_right = keyboard_check(vk_right);
 key_up = keyboard_check(vk_up);
 key_down = keyboard_check(vk_down);
}
key_action = keyboard_check_pressed(ord("Z"));
key_back = keyboard_check_pressed(ord("X"));

var _xinput = key_right - key_left;
var _yinput = key_down - key_up;
var _dinput = point_direction(0,0,_xinput,_yinput);
var _minput = point_distance(0,0,_xinput,_yinput);

if (_minput != 0)
{
	direction = _dinput;	
	image_speed = 1;
}
else
{
	image_speed = 0;
	anim_index = 0;
}

four_direction_animate();


if(image_index >= 0 and image_index < 4){
	_savedface_x = 16;
	_savedface_y = 0;
}
else if(image_index >= 4 and image_index < 8){
	_savedface_x = 0;
	_savedface_y = -16;
}
else if(image_index >= 8 and image_index < 12){
	_savedface_x = -16;
	_savedface_y = 0;
}
else if(image_index >= 12 and image_index < 16){
	_savedface_x = 0;
	_savedface_y = 16;
}


move_and_collide(_xinput*spd_walk, _yinput*spd_walk, obj_wall, 4, 0, 0, spd_walk, spd_walk);

switch (true){
	case key_action:
		if(collision_line(x,y,x+_savedface_x,y+ _savedface_y, obj_npc, true, false) != noone){
			with (instance_nearest(x,y, obj_npc)){
				if(interacted == false){
					alarm[0]= 2;
					interacted = true;
				}
			}
		}
		break;
}
