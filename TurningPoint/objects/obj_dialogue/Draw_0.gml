draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_ds);


switch(display_state){
	case DISPLAY.NORMAL:
		
		draw_sprite_stretched(spr_text_box, 0, global.cam_top_x+8, global.cam_top_y + 154,240, 34);
		draw_set_color(c_white);
		draw_text(global.cam_top_x+14, global.cam_top_y+156, string_copy(text_set.text,1,display_num));
		if(text_set.name != ""){
			var _v = string_width(text_set.name)+10
			//draw_set_color(c_yellow)
			draw_sprite_stretched(spr_text_box_s, 0, global.cam_top_x+10, global.cam_top_y + 138,_v, 18);
			draw_set_color(c_black);
			draw_text(global.cam_top_x+14, global.cam_top_y+140, text_set.name);
		}
		if(all_text_displayed = true){
			draw_sprite(spr_pointer, 0, global.cam_top_x+global.cam_width - 16, global.cam_top_y+global.cam_height - 16);
		}
		break;
	case DISPLAY.LEGEND:
		//draw_sprite(tpCodices, 0, global.cam_top_x, global.cam_top_y);
		draw_set_color(c_white);
		draw_text(global.cam_top_x+14, global.cam_top_y+156, string_copy(text_set.text,1,display_num));
		if(all_text_displayed = true){
			draw_sprite(spr_pointer, 0, global.cam_top_x+global.cam_width - 16, global.cam_top_y + global.cam_height- 16);
		}
		break;
	case DISPLAY.OVERHEAD:
		//global.cam_top_x+128, global.cam_top_y+16
		draw_sprite_stretched(spr_text_box, 0, global.cam_top_x+8, global.cam_top_y+4,240, 34);
		draw_set_color(c_white);
		draw_text(global.cam_top_x+14, global.cam_top_y+8, string_copy(text_set.text,1,display_num));
		if(text_set.name != ""){
			var _v = string_width(text_set.name)+10
			//draw_set_color(c_yellow)
			draw_sprite_stretched(spr_text_box_s, 0, global.cam_top_x+16, global.cam_top_y + 36,_v, 18);
			draw_set_color(c_black);
			draw_text(global.cam_top_x+20, global.cam_top_y+40, text_set.name);
		}
		if(all_text_displayed = true){
			draw_sprite(spr_pointer, 0, global.cam_top_x+global.cam_width - 16, global.cam_top_y + 28);
		}
		break;
	case DISPLAY.PLAIN:
		draw_text(global.cam_top_x+14, global.cam_top_y+156, string_copy(text_set.text,1,display_num));
		break;
}

//display_num +=1;


