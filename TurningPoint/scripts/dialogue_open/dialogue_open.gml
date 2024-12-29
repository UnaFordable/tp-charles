function dialogue(_dialogue_type, _text_set, _sequence, _scene_timer){
	if(!instance_exists(obj_dialogue)){
		
		with(instance_create_depth(0,0, -99999, obj_dialogue)){
			text_set = _text_set;
			display_state = _dialogue_type;
			if(!instance_exists(obj_battle)){
				if(	display_state == DISPLAY.LEGEND){
					audio_play_sound(_17__Snowfall, 1,true);
					instance_create_depth(global.cam_top_x, global.cam_top_y+144,depth+1, obj_filmbackground, {angle: 0, size: spr_film_background});
				}
				else{
					instance_create_depth(global.cam_top_x, global.cam_top_y+176,depth+1, obj_filmbackground, {angle: 0, size: spr_film_background_s});
				}
				instance_create_depth(global.cam_top_x+256, global.cam_top_y+16,depth+1, obj_filmbackground, {angle: 180, size: spr_film_background_s});
			}
			if(_sequence != undefined and !(instance_exists(obj_tween))){
				instance_create_depth(global.cam_top_x, global.cam_top_y, depth+ 2, obj_tween,{sequence_pause: _scene_timer, cutscene: _sequence});
			}
			if(_scene_timer != undefined)display_delay=_scene_timer; else display_delay = 0;
		}
		
	}
	else{
		with(obj_dialogue){
			pendingnum += 1;
			pending_display_state[pendingnum] = _dialogue_type;
			pending_text_set[pendingnum] = _text_set;
			if(_scene_timer != undefined){pending_display_delay[pendingnum] = _scene_timer;} else {pending_display_delay[pendingnum] = 0;}
		}
		
		with(obj_tween){
			if(_scene_timer != undefined){pending_pause[obj_dialogue.pendingnum] = _scene_timer;} else {pending_pause[obj_dialogue.pendingnum] = 0;}
		}

	}
}