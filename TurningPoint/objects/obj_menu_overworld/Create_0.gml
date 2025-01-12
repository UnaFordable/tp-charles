/// @description Insert description here
// You can write your code in this editor
enum MENU{
	STATS,
	ITEMS,
	PERKS,
	OPTIONS
}
background_img = 0;
m_state = MENU.STATS;


m_character_selected = 0;

instance_create_depth(global.cam_bottom_x+32, global.cam_bottom_y, depth, obj_bsm_button_1);
instance_create_depth(global.cam_bottom_x+88, global.cam_bottom_y, depth, obj_bsm_button_2);
instance_create_depth(global.cam_bottom_x+144, global.cam_bottom_y, depth, obj_bsm_button_3);
instance_create_depth(global.cam_bottom_x+200, global.cam_bottom_y, depth, obj_bsm_button_4);


for(var _i = 0; _i < array_length(global.party); _i ++){
	instance_create_depth(global.cam_bottom_x, (global.cam_bottom_y +(_i*40)+32),depth, obj_omcd_button_1, 
	{new_char_sel: _i});
	//draw_sprite_ext(spr_omcd, 0,global.cam_bottom_x,(global.cam_bottom_y +(_i*40)+32),1,1,0,$FFFFFF,1);
	//draw_sprite_ext(global.party[_i].sprites.walk, 0, global.cam_bottom_x+18,(global.cam_bottom_y +(_i*40)+64), 1,1,0,c_white, 1);
}