/// @description Insert description here
// You can write your code in this 
global.cam_top_x = camera_get_view_x(view_camera[0]);
global.cam_top_y = camera_get_view_y(view_camera[0]);
global.cam_bottom_x = camera_get_view_x(view_camera[1]);
global.cam_bottom_y = camera_get_view_y(view_camera[1]);

audio_stop_all();
if(room != rm_init and room != rm_main_menu){
	if(!instance_exists(obj_menu_overworld)){
		instance_create_depth(global.cam_bottom_x, global.cam_bottom_y, -999,obj_menu_overworld)
	}
}
switch(room){
	case rm_minigame_hub:
		
		break;
	case rm_main_menu:
		//audio_play_sound(_57__Green_Grounds,1,false)
		instance_create_depth(global.cam_top_x, global.cam_top_y+176,-257, obj_filmbackground, {angle: 0, size: spr_film_background_s});
		instance_create_depth(global.cam_top_x+256, global.cam_top_y+16,-257, obj_filmbackground, {angle: 180, size: spr_film_background_s});
		break;
}
