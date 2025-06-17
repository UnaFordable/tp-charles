/// @description Insert description here
// You can write your code in this editor
if (life_time < 0){
	instance_destroy();
	if(instance_exists(obj_CUTSCENE)) with(obj_CUTSCENE){
		cutscene_end_action();
	}
}
else{
	life_time --;
}