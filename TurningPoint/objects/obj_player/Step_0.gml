/// @description Insert description here
// You can write your code in this editor
depth = -y;
var _xinput = keyboard_check(vk_right) - keyboard_check(vk_left);
var _yinput = keyboard_check(vk_down) - keyboard_check(vk_up);
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

//x += lengthdir_x(spd_walk*_minput,_dinput);
//y += lengthdir_y(spd_walk*_minput,_dinput);

move_and_collide(_xinput*spd_walk, _yinput*spd_walk, obj_wall, 4, 0, 0, spd_walk, spd_walk);