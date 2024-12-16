/// @description Insert description here
// You can write your code in this editor
battle_state();


if(cursor.active){
	with(cursor){
		var _key_up = keyboard_check_pressed(vk_up);
		var _key_down = keyboard_check_pressed(vk_down);
		var _key_left = keyboard_check_pressed(vk_left);
		var _key_right = keyboard_check_pressed(vk_right);
		var _key_toggle = false;
		var _key_confirm = false;
		var _key_cancel = false;
		confirm_delay++;
		if(confirm_delay > 1){
			_key_confirm = keyboard_check_pressed(ord("Z"));
			_key_cancel = keyboard_check_pressed(ord("X"));
			_key_toggle = keyboard_check_pressed(vk_shift);
		}
		var _move_h = _key_right-_key_left;
		var _move_v = _key_up-_key_down;
		switch(_move_v){
			case -1:
				target_side = obj_battle.party_units;
				break;
			case 1:
				target_side = obj_battle.enemy_units;
				break;
		}
	
		if(target_side == obj_battle.enemy_units){
			target_side = array_filter(target_side, function(_element, _index){return _element.hp>0});
		}
	
		if(target_all == 0){
			switch(_move_h){
				case -1:
					target_index--;
					break;
				case 1:
					target_index++;
					break;
			}
			
			var _targets = array_length(target_side);
			if(target_index < 0){ 
				target_index = _targets - 1;
			}
			if(target_index > (_targets - 1)){ 
				target_index = 0;
			}
		
			active_target = target_side[target_index];
			if(active_action.target_all == MODE.VARIES) and (_key_toggle){
				target_all = 1;
			}
		}
		else{
			active_target = target_side;
			active_error = false;
			if(active_action.target_all == MODE.VARIES) and (_key_toggle){//Switch to single mode
				target_all = 0;
			}
		}
		if(!active_error){
			if(_key_confirm){
				with(obj_battle){
					begin_action(cursor.active_user, cursor.active_action, cursor.active_target);
				}
				with(obj_menu){
					instance_destroy();
				}
				active = false;
				confirm_delay = 0;
			}
		}
		if(_key_cancel)and(!_key_confirm){
			with(obj_menu){
				active = true;
			}
			active = false;
			confirm_delay = 0;
		}
	}
	
}



