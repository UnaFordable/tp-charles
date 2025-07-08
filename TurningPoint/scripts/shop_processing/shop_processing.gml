// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shop_processing(_shop_array){
	instance_deactivate_all(true);
	instance_create_depth(x,y,-9999, obj_shop_menu);
	instance_create_depth(global.cam_bottom_x + 48, global.cam_bottom_y+24, -9999, obj_shop_button, 
		{image_xscale: 3, name: "Buy", level_def: 0, button_func : function(){obj_shop_button.menu_level = 1;}});
	instance_create_depth(global.cam_bottom_x + 48, global.cam_bottom_y+24, -9999, obj_shop_button, 
		{image_xscale: 2, name: "Back", level_def: 1, button_func : function(){obj_shop_button.menu_level = 0;}});
	for(var _i = 0; _i < array_length(_shop_array); _i++){
		instance_create_depth(global.cam_bottom_x + 8, global.cam_bottom_y+40+(_i*20), -9999, obj_shop_button);
	}
	
}