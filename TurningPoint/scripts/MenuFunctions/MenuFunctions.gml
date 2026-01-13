// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function menu(_x, _y, _options, _description = -1, _width = undefined, _height = undefined){
	with(instance_create_depth(_x, _y, -99999, obj_battle_menu)){
		options = _options;
		description = _description;
		var _option_count = array_length(_options);
		visible_options_max = _option_count;
		xmargin = 8;
		ymargin = 8;
		draw_set_font(fnt_ds);
		height_line = 64;
		if(_width == undefined){
			width = 1;
			if(description != -1){
				width = max(width, string_width(_description));
			}
			for(var _i = 0; _i < _option_count; _i++){
				width = max(width, string_width(_options[_i][0]));
			}
			width_full = width + xmargin * 2;
		}
		else{
			width_full = _width;
		}
		if(_height == undefined){
			height = height_line * (_option_count + !(description == -1));
			height_full = height + ymargin + 1;
		}
		else{
			height_full = _height;
			if(height_line * (_option_count + !(description == -1)) > 256/*_height - (ymargin*2)*/){
				scrolling = true;
				visible_options_max = (_height - ymargin * 2) div height_line;
			}
		}
		for (var _i = 0; _i < array_length(_options); _i ++){
			instance_create_depth(global.cam_bottom_x+16+(_i*50),global.cam_bottom_y+16, depth,obj_bm_button, {m_hover : _i, button_name: _options[_i][0]});
			
		}
		instance_create_depth(_x,_y+32, depth,obj_menugoback);
		
	}
}

function sub_menu(_options){
	options_above[sub_menu_level] = options;
	sub_menu_level++;
	options = _options;
	hover = 0;
}

function menu_go_back(){
	sub_menu_level--;
	options = options_above[sub_menu_level];
	hover = 0;
}

function menu_select_action(_user, _action){
	with(obj_battle_menu){
		active = false;
	}
	with(obj_battle){
		if(_action.target_required){	
			for(var _i = 0; _i < array_length(enemy_units); _i++){
				instance_create_depth(global.cam_width/2+16,global.cam_bottom_y+32+(16*_i),depth-1,obj_target_select, {char_index: _i, m_target_side : object_index.enemy_units});
			}
			for(var _i = 0; _i < array_length(party_units); _i++){
				instance_create_depth(global.cam_bottom_x+16,global.cam_bottom_y+32+(16*_i),depth-1,obj_target_select, {char_index: _i, m_target_side : object_index.party_units});
			}
			with(cursor){
				active_action = _action;
				target_all = _action.target_all;
				if(target_all == MODE.VARIES){
					target_all = 1;
				}
				active_user = _user;
				active = true;
				if(_action.target_enemy_by_default){
					target_index = 0;
					target_side = obj_battle.enemy_units;
					active_target = obj_battle.enemy_units[target_index];
				}
				else{
					target_side = obj_battle.party_units;
					active_target = active_user;
					var _find_self = function(_element){return(_element == active_target)};
					target_index = array_find_index(obj_battle.party_units, _find_self);
				}
			}
			
		}
		else{
			with(obj_battle_menu){
				instance_destroy();
			}
			begin_action(_user, _action, -1);
		}
	}
}
/*
function perks_change_assigned_char(){
	
}
*/