/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_dialogue) and instance_exists(obj_battle)){
	with obj_dialogue next_step = true;
	with(obj_battle){
		if(current_user.acting == false){
			if(!instance_exists(obj_battle_effect) and conclusion_type = -1){
				//battle_wait_time_remaining --;
				//if(battle_wait_time_remaining == 0){
					battle_state = battle_state_victor_check;
				//}
			}
		}
	}
}