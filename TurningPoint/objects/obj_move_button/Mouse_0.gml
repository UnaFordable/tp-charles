/// @description Insert description here
// You can write your code in this editor
image_index = 1;
pressed = true;
if(instance_exists(obj_player) and !instance_exists(obj_CUTSCENE) and !instance_exists(obj_dialogue)){
	switch(m_direction){
		case 0:
			obj_player.key_up = true;
			break;
		case 1:
			obj_player.key_left = true;
			break;
		case 2:
			obj_player.key_down = true;
			break;
		case 3:
			obj_player.key_right = true;
			break;
		default:
			obj_player.key_action = false;
			break;
	}
}
else{
	switch(m_direction){
		case 0:
			obj_player.key_up = false;
			break;
		case 1:
			obj_player.key_left = false;
			break;
		case 2:
			obj_player.key_down = false;
			break;
		case 3:
			obj_player.key_right = false;
			break;
		default:
			obj_player.key_action = false;
			break;
	}
}