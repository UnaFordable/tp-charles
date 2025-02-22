/// @description Insert description here
// You can write your code in this editor
with(obj_battle_menu) instance_destroy();
for (var _i = 0; _i < array_length(global.party); _i++){
	global.party[_i].hp = party_units[_i].hp;
	global.party[_i].ep = party_units[_i].ep;
}
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
	//with(){
		
	//}
}