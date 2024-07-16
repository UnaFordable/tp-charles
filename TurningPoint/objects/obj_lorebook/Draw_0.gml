/// @description Insert description here
// You can write your code in this editor
draw_rectangle_color(global.cam_top_x, global.cam_top_y,global.cam_top_x+ global.cam_width,global.cam_top_y+ global.cam_height, c_blue,c_blue, c_navy, c_navy, false);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_white);
//draw_sprite_stretched(spr_text_box, 0, global.cam_top_x-8, global.cam_top_y-8, global.cam_width+16, 24)
draw_set_font(fnt_ds);
draw_text(4,4,"Lore");
switch level{
	case CATEGORY.A:
		for (var _i=0; _i < variable_struct_names_count(lore.Character1); _i++){
			var _e = struct_get_names(lore.Character1);
			draw_text(16,16+(16*_i),_e[_i]);
		}
		break;
	case CATEGORY.B:
		draw_text(8,16,path.desc);
		draw_sprite(path.animation, 0, global.cam_bottom_x+(global.cam_width/2), global.cam_bottom_y+(global.cam_height/2));
		break;
}
if(level = CATEGORY.A) draw_sprite(spr_pointer, 0,14,22+((_i+12)*hover));