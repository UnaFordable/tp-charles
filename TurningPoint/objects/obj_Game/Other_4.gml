/// @description Insert description here
// You can write your code in this 
global.cam_top_x = camera_get_view_x(view_camera[0]);
global.cam_top_y = camera_get_view_y(view_camera[0]);
global.cam_bottom_x = camera_get_view_x(view_camera[1]);
global.cam_bottom_y = camera_get_view_y(view_camera[1]);

audio_stop_all();
if(room != rm_init and room != rm_main_menu){
	if(!instance_exists(obj_menu_overworld)){
		instance_create_depth(global.cam_bottom_x, global.cam_bottom_y,-999, obj_menu_toggle);
		instance_create_depth(global.cam_bottom_x, global.cam_bottom_y, -999,obj_menu_overworld)
		for(var _i = 0; _i < 4; _i++){
			instance_create_depth(global.cam_bottom_x + global.cam_width/2, global.cam_bottom_y + global.cam_height/2, -999, obj_move_button, {m_direction: _i})
		}
		instance_create_depth(global.cam_bottom_x+216, global.cam_bottom_y+144,-999, obj_action_button);
	}
	instance_deactivate_object(obj_menu_overworld);
	instance_deactivate_object(obj_omcd_button_1);
	instance_deactivate_object(obj_bsm_button_1);
}
switch(room){
	case rm_minigame_hub:
		
		break;
	case rm_main_menu:
		//audio_play_sound(_57__Green_Grounds,1,false)
		instance_create_depth(global.cam_top_x, global.cam_top_y+176,-257, obj_filmbackground, {angle: 0, size: spr_film_background_s});
		instance_create_depth(global.cam_top_x+256, global.cam_top_y+16,-257, obj_filmbackground, {angle: 180, size: spr_film_background_s});
		break;
	case rm_buckotrail:
	stats_update();
	/*
		for(var _i = 0; _i < array_length(global.party); _i++){
			var _party = global.party[_i];
			_party.hp = _party.hp_max;
			_party.ep = _party.ep_max;
		}
		*/
		break;
}


