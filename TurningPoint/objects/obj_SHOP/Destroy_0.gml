/// @description Insert description here
// You can write your code in this editor
instance_activate_all();
with(obj_shop_button){
	instance_destroy()
}
with(obj_shop_item_button){
	instance_destroy();
}
if(instance_exists(obj_CUTSCENE)){ 
	with(obj_CUTSCENE) 
		cutscene_end_action();
}