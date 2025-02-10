/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_bsm_background, background_img, global.cam_bottom_x, global.cam_bottom_y);

draw_set_font(fnt_ds);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
switch(m_state){
	case MENU.STATS:
		background_img = 0;
		var _ss = global.party[m_character_selected];
		text_display(1,global.cam_bottom_x + 40, global.cam_bottom_y + 40, _ss.name);
		draw_set_halign(fa_left);
		text_display(1,global.cam_bottom_x + 40, global.cam_bottom_y +(48)+16, "Level:");
		text_display(1,global.cam_bottom_x + 40, global.cam_bottom_y +(48)+32, "Attack:");
		text_display(1,global.cam_bottom_x + 40, global.cam_bottom_y +(48)+48, "Defense:");
		text_display(1,global.cam_bottom_x + 40, global.cam_bottom_y +(48)+64, "Special:");
		text_display(1,global.cam_bottom_x + 40, global.cam_bottom_y +(48)+80, "Speed:");
		text_display(1,global.cam_bottom_x + 40, global.cam_bottom_y +(48)+96, "EXP:");
		text_display(1,global.cam_bottom_x + 40, global.cam_bottom_y +(48)+112, "Next Level:");
		draw_set_halign(fa_right);
		text_display(2,global.cam_bottom_x + 135, global.cam_bottom_y +(48)+16, string(_ss.level));
		text_display(2,global.cam_bottom_x + 135, global.cam_bottom_y +(48)+32, string(_ss.attack));
		text_display(2,global.cam_bottom_x + 135, global.cam_bottom_y +(48)+48, string(_ss.defense));
		text_display(2,global.cam_bottom_x + 135, global.cam_bottom_y +(48)+64, string(_ss.special));
		text_display(2,global.cam_bottom_x + 135, global.cam_bottom_y +(48)+80, string(_ss.spd));
		text_display(2,global.cam_bottom_x + 135, global.cam_bottom_y +(48)+96, string(_ss.experience));
		text_display(2,global.cam_bottom_x + 135, global.cam_bottom_y +(48)+112, string(_ss.exp_max));
		draw_set_halign(fa_left);
		text_display(1,global.cam_bottom_x + 152, global.cam_bottom_y +(48)+16, "Hp: ");
		if(_ss.name!="Shelly")text_display(1,global.cam_bottom_x + 152, global.cam_bottom_y +(48)+32, "NRG:");
		draw_set_halign(fa_right);
		text_display(2,global.cam_bottom_x + 247, global.cam_bottom_y +(48)+16,string(_ss.hp)+"/"+string(_ss.hp_max));
		if(_ss.name!="Shelly")text_display(2,global.cam_bottom_x + 247, global.cam_bottom_y +(48)+32, string(_ss.ep) + "/" + string(_ss.ep_max));
		break;
	case MENU.ITEMS:
		background_img = 1;
		var _ss = global.party[m_character_selected];
		draw_set_halign(fa_left);
		text_display(1,global.cam_bottom_x + 152, global.cam_bottom_y +(48)+16, "Hp: ");
		if(_ss.name!="Shelly")text_display(1,global.cam_bottom_x + 152, global.cam_bottom_y +(48)+32, "NRG:");
		draw_set_halign(fa_right);
		text_display(2,global.cam_bottom_x + 247, global.cam_bottom_y +(48)+16,string(_ss.hp)+"/"+string(_ss.hp_max));
		if(_ss.name!="Shelly")text_display(2,global.cam_bottom_x + 247, global.cam_bottom_y +(48)+32, string(_ss.ep) + "/" + string(_ss.ep_max));
		draw_set_halign(fa_left);
		try{
			var _item = global.inventory[m_item_seleted][0];
			text_display(1,global.cam_bottom_x + 152, global.cam_bottom_y +(48)+48, string(_item.info));
		}
		catch(DoConv){}
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

