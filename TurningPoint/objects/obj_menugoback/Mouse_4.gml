/// @description Insert description here
// You can write your code in this editor
if(obj_battle_menu.sub_menu_level > 0 && obj_battle_menu.active == true){
	with obj_battle_menu menu_go_back();
	instance_activate_object(obj_bm_button);
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