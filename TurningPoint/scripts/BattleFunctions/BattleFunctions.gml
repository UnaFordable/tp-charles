// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function new_encounter(_enemies, _bg){
	instance_create_depth(global.cam_top_x, global.cam_top_y, -9999, obj_battle, {enemies: _enemies, creator: id, battle_background: _bg});
}

function battle_change_hp(_target, _amount, _alive_dead_or_either = 0){
	var _failed = false;
	if(_alive_dead_or_either == 0) and (_target.hp <= 0){
		_failed = true;
	}
	if(_alive_dead_or_either == 1) and (_target.hp > 0){
		_failed = true;
	}
	var _col = c_white;
	if(_amount > 0){
		_col = c_lime;
	}
	if(_failed){
		_col = c_white;
		_amount = "failed";
	}
	instance_create_depth(_target.x, _target.y, _target.depth-1, obj_battle_floating_text, {font: fnt_ds, col: _col, text: string(_amount)});
	if(!_failed){
		_target.hp = clamp(_target.hp + _amount, 0, _target.hp_max);
	}
}

function battle_add_block(_target, _amount, _alive_dead_or_either = 0){
	var _failed = false;
	if(_alive_dead_or_either == 0) and (_target.hp <= 0){
		_failed = true;
	}
	if(_alive_dead_or_either == 1) and (_target.hp > 0){
		_failed = true;
	}
}

function is_action_available(_unit, _action){
	if(variable_struct_exists(_action, "ep_cost")){
		if(_unit.ep >= _action.ep_cost){
			return true;
		}
	}
	else{
		return true;
	}
	return false;
}
