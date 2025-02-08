/// @description Insert description here
// You can write your code in this editor
with(obj_menu) instance_destroy();
with (obj_battle_unit) instance_destroy();
with (obj_filmbackground) instance_destroy();
instance_activate_all();
if (conclusion_type == 2){
	with (creator){
		escape_delay = 300;
		visible = true;
	}
}
if (conclusion_type == 1){
	with (creator){
		dead = true;
		visible = false;
		instance_deactivate_object(id);
		
	}
}