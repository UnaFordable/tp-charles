/// @description Insert description here
// You can write your code in this editor

var _x = mouse_x - x;
var _y = mouse_y - y;
var _z = 4;  //depth between eye and mouse
var _d = max_radius / sqrt( _x * _x + _y * _y + _z * _z );
var _xx, _yy;

switch(obj_pet_body.pet_state){
	case PETSTATE.LOOKING:
		_xx  = x+_x*_d;
		_yy = y+_y*_d;
		draw_sprite(sprite_index,0, _xx, _yy);
		break;
	case PETSTATE.NORMAL:
		_xx  = x;
		_yy = y;
		draw_sprite(sprite_index,0, _xx, _yy);
		break;
	case PETSTATE.BEINGPET:
		_xx  = x+_x*_d;
		_yy = y+_y*_d;
		break;
}

