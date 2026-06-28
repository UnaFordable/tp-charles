/// @description Insert description here
// You can write your code in this editor
stats_update();

global.cam_bottom_x = camera_get_view_x(view_camera[1]);
global.cam_bottom_y = camera_get_view_y(view_camera[1]);

global.cam_top_x = camera_get_view_x(view_camera[0]);
global.cam_top_y = camera_get_view_y(view_camera[0]);

var _b = ds_map_find_first(background_map);
layer_x("Background", global.cam_top_x);
layer_y("Background", global.cam_top_y);