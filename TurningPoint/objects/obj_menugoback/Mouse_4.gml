/// @description Insert description here
// You can write your code in this editor
if(obj_battle_menu.sub_menu_level > 0 && obj_battle_menu.active == true){
	with obj_battle_menu{
		menu_go_back();
		
	}
	for (var _i = 0; _i < array_length(obj_battle_menu.options); _i ++){
		instance_create_depth(global.cam_bottom_x+16+(_i*50),global.cam_bottom_y+16,depth,obj_bm_button, {m_hover : _i, button_name: obj_battle_menu.options[_i][0]});
	}
}

if(obj_battle.cursor.active){
	with(obj_battle_menu){
		active = true;
	}
	with(obj_battle){
		active = false;
		confirm_delay = 0;
	}
}

if(instance_exists(obj_target_select)){
	with(obj_target_select){
		instance_destroy();
	}
}