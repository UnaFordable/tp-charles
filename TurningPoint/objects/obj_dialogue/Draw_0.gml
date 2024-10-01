draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_ds);



switch(display_state){
	case DISPLAY.NORMAL:
		draw_sprite_stretched(spr_text_box, 0, global.cam_top_x+8, global.cam_top_y + 154,240, 34);
		draw_set_color(c_white);
		draw_text(global.cam_top_x+14, global.cam_top_y+156, text_set[0].text);
		if(text_set[0].name != ""){
			var _v = string_width(text_set[0].name)+10
			//draw_set_color(c_yellow)
			draw_sprite_stretched(spr_text_box_s, 0, global.cam_top_x+10, global.cam_top_y + 140,_v, 18);
			draw_set_color(c_black);
			draw_text(global.cam_top_x+14, global.cam_top_y+142, text_set[0].name);
		}
		break;
	case DISPLAY.LEGEND:
		//draw_set_color(c_yellow);
		draw_text(global.cam_top_x+14, global.cam_top_y+156, text_set[0].text);
		
		break;
	case DISPLAY.OVERHEAD:
		break;
	case DISPLAY.PLAIN:
		break;
}