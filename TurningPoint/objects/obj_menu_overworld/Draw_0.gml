/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_bsm_background, background_img, global.cam_bottom_x, global.cam_bottom_y);
for(var _i = 0; _i < array_length(global.party); _i ++){
	draw_sprite_ext(spr_omcd, 0,global.cam_bottom_x,(global.cam_bottom_y +(_i*40)+32),1,1,0,$FFFFFF,1);
	draw_sprite_ext(global.party[_i].sprites.walk, 0, global.cam_bottom_x+18,(global.cam_bottom_y +(_i*40)+64), 1,1,0,c_white, 1);
}
draw_set_font(fnt_ds);
draw_set_valign(fa_top);
draw_set_halign(fa_left)
switch(m_state){
	case MENU.STATS:
		background_img = 0;
		for(var _i = 0; _i < array_length(global.party); _i ++){
			var _ss = global.party[_i];
			draw_text(global.cam_bottom_x + 45, global.cam_bottom_y +(_i*40)+32, _ss.name);
			draw_text(global.cam_bottom_x + 128, global.cam_bottom_y +(_i*40)+32, "Lv: " + string(_ss.level));
			draw_text(global.cam_bottom_x + 45, global.cam_bottom_y +(_i*40)+45, "Hp: " + string(_ss.hp)+"/"+string(_ss.hp_max));
			if(_ss.name!="Shelly")draw_text(global.cam_bottom_x + 45, global.cam_bottom_y +(_i*40)+57, "NRG: " + string(_ss.ep) + "/" + string(_ss.ep_max));
		}
		break;
	case MENU.ITEMS:
		background_img = 1;
		break;
	case MENU.PERKS:
		background_img = 2;
		break;
	case MENU.OPTIONS:
		background_img = 3;
		break;
	default:
		break;
}

