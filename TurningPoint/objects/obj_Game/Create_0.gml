/// @description Insert description here
// You can write your code in this editor
global.cam_width = 256;
global.cam_height = 192;
global.cam_top_x = camera_get_view_x(view_camera[0]);
global.cam_top_y = camera_get_view_y(view_camera[0]);
global.cam_bottom_x = camera_get_view_x(view_camera[1]);
global.cam_bottom_y = camera_get_view_y(view_camera[1]);


screen_width = 256
screen_height = 192;

party_members[0] = 1;
col = c_green;


char_stats()

//Minigame variables
minigame_scores = [[],[],[],[],[]];
for (var _i = 0; _i < array_length(minigame_scores); _i++){
	for(var _j = 0; _j < 5; _j++){
		array_insert(minigame_scores[_i], _j, 0);
	}
}