/// @description Insert description here
// You can write your code in this editor
image_index = 0;
pressed = false;
if(instance_exists(obj_player) and !instance_exists(obj_dialogue)){
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
		
	}
}