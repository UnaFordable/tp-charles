// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cutscene_begin(_info){
	
	if(!instance_exists(obj_CUTSCENE)){
		with(instance_create_depth(x,y,depth, obj_CUTSCENE)){
			scene_info = _info;
		}
		if(!instance_exists(obj_battle)){
			//instance_create_depth(global.cam_top_x, global.cam_top_y+176,depth+1, obj_filmbackground, {angle: 0, size: spr_film_background_s});
			//instance_create_depth(global.cam_top_x+256, global.cam_top_y+16,depth+1, obj_filmbackground, {angle: 180, size: spr_film_background_s});
		}
	}
	
}

function cutscene_wait(_seconds){
	timer++;
	if(timer >= _seconds*room_speed){
		timer = 0;
		cutscene_end_action();
	}
}

function cutscene_end_action(){
	scene ++;
	if(scene > array_length(scene_info)-1){
		instance_destroy();
	}
}

function create_house_at_mouse(){
	if(mouse_check_button_pressed(mb_left)){
		instance_create_depth(mouse_x,mouse_y, -999, obj_house);
		cutscene_end_action();
	}
}

function cutscene_play_music(_music){
	if(_music == undefined){
		audio_stop_all();
	}
	else{
		audio_play_sound(_music, 1, true);
	}
	cutscene_end_action();
}
function cutscene_play_soundeffect(_se){
	audio_play_sound(_se, 2, false);
	cutscene_end_action();
}

function cutscene_instance_create(_x, _y, _object){
	var _inst = instance_create_layer(_x, _y, "Instances", _object);
	cutscene_end_action();
	return _inst;
}

function cutscene_instance_destroy(_object){
	with(_object){
		instance_destroy();
	}
	cutscene_end_action();
}

function cutscene_instance_destroy_nearest(_x, _y, _object){
	var _inst = instance_nearest(_x, _y, _object)
	cutscene_instance_destroy(_inst);
}

function move_character(_obj, _x, _y, _relative, _spd, _animate = true){

	if(x_dest == -1){
		if(_relative){
			x_dest = _obj.x + _x;
			y_dest = _obj.y + _y;
		}
	}
	
	var _xx = x_dest;
	var _yy = y_dest;
	
	if (instance_exists(_obj)) with (_obj){
		if(point_distance(x,y,_xx,_yy) != 0 and _animate = true){
			direction = point_direction(x,y,_xx,_yy);	
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
		if(point_distance(x,y,_xx,_yy) >= _spd){
			var _dir = point_direction(x,y, _xx, _yy);
			var _ldirx = lengthdir_x(_spd, _dir);
			var _ldiry = lengthdir_y(_spd, _dir);
			

			x += _ldirx;
			y += _ldiry;
		}
		else{
			x = _xx;
			y = _yy;
			with(other){
				x_dest = -1;
				y_dest = -1;
				cutscene_end_action();
			}
		}
	}
}
	
function cutscene_object_change_sprite(_obj, _sprite, _frame = 0){
	with (_obj){
		sprite_index = _sprite;
		image_index = _frame;
	}
	cutscene_end_action();
}
	
function cutscene_expression(_obj, _expression){
	var _fx = instance_create_depth(_obj.x, _obj.y - 32, -y, obj_fx_expression, {sprite_index: _expression});
	return _fx
}