/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_battle_menu)){
	if(obj_battle_menu.sub_menu_level < 0)instance_destroy();
}
else{
	instance_destroy();
}