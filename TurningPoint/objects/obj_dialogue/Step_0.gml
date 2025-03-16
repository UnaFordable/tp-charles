/// @description Insert description here
// You can write your code in this editor

if(display_delay < 0){
	display_num +=1;
	if(obj_player.key_action = true/*keyboard_check_pressed(ord("Z"))*/){
		if(display_num < string_length(text_set.text)){
			display_num = string_length(text_set.text);
		}
		else{
			all_text_displayed = false;
			if(pendingnum = 0){
				audio_stop_sound(_17__Snowfall);
				with(obj_tween){
					instance_destroy();
				}
				//if(instance_exists(obj_battle)){
				//	obj_battle.battle_state = battle_state_select_action;
				//}
				instance_destroy();
				
			}
			else {
				text_set = pending_text_set[1];
				display_state = pending_display_state[1];
				display_delay = pending_display_delay[1];
				for(var _i = 0; _i < pendingnum; _i++){
					pending_text_set[_i] = pending_text_set[_i + 1];
					pending_display_state[_i] = pending_display_state[_i+1];
					pending_display_delay[_i] = pending_display_delay[_i+1];
				}
				pendingnum -= 1;
			}
		}
		display_num = 0;
	}
}
else{
	display_delay --;
}


if(display_num = string_length(text_set.text)){
	all_text_displayed = true;
}