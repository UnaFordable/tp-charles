/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_bsm_background, background_img, global.cam_bottom_x, global.cam_bottom_y);

draw_set_font(fnt_ds);
draw_set_valign(fa_top);
draw_set_halign(fa_left)
switch(m_state){
	case MENU.STATS:
		background_img = 0;
		var _ss = global.party[m_character_selected];
		draw_text(global.cam_bottom_x + 40, global.cam_bottom_y + 40, _ss.name);
		draw_text(global.cam_bottom_x + 48, global.cam_bottom_y +(48)+16, "Level: " + string(_ss.level));
		draw_text(global.cam_bottom_x + 48, global.cam_bottom_y +(48)+32, "Attack: " + string(_ss.attack));
		draw_text(global.cam_bottom_x + 48, global.cam_bottom_y +(48)+48, "Defense: " + string(_ss.defense));
		draw_text(global.cam_bottom_x + 48, global.cam_bottom_y +(48)+64, "Special: " + string(_ss.special));
		draw_text(global.cam_bottom_x + 48, global.cam_bottom_y +(48)+80, "Speed: " + string(_ss.spd));
		draw_text(global.cam_bottom_x + 48, global.cam_bottom_y +(48)+96, "EXP: " + string(_ss.spd));
		draw_text(global.cam_bottom_x + 48, global.cam_bottom_y +(48)+112, "Next Level: " + string(_ss.spd));
		
		draw_text(global.cam_bottom_x + 144, global.cam_bottom_y +(48)+16, "Hp:" + string(_ss.hp)+"/"+string(_ss.hp_max));
		if(_ss.name!="Shelly")draw_text(global.cam_bottom_x + 144, global.cam_bottom_y +(48)+32, "NRG:" + string(_ss.ep) + "/" + string(_ss.ep_max));
		
		break;
	case MENU.ITEMS:
		background_img = 1;
		for(var _i = 0; _i < array_length(global.inventory); _i++){
			draw_text(global.cam_bottom_x + 48, global.cam_bottom_y +48 +(_i*16), string(global.inventory[_i][0].name)+" "+string(global.inventory[_i][1]));
			//draw_text(global.cam_bottom_x + 48, global.cam_bottom_y +48 +(_i*16), );
		}
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

