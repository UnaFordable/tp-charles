/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_set_font(fnt_ds);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
/*
var _desc = !(description == -1);
var _scroll_push = max(0, hover - (visible_options_max -1));
var _attack_option_y_pos = global.cam_bottom_y + 70;

for(var _i = 0; _i < visible_options_max + _desc; _i++){
	if(_i >= array_length(options)){
		break;
	}
	draw_set_color(c_white);
	if(_i== 0) and (_desc){
		draw_text(global.cam_bottom_x+ xmargin, _attack_option_y_pos +ymargin, description);
	}
	else{
		var _c = c_white
		var _option_to_show = _i  - _desc + _scroll_push;
		var _str = options[_option_to_show][0];
		if(hover == _option_to_show - _desc){
			draw_set_color(c_yellow);
			_c = c_yellow
		}
		if(options[_option_to_show][3] == false){
			draw_set_color(c_grey);
			draw_set_color(c_white);
		}
		draw_sprite_stretched_ext(spr_text_box, 0, global.cam_bottom_x+_i*height_line, _attack_option_y_pos, width_full, height_full,_c,1);
		draw_text(global.cam_bottom_x+ xmargin+_i*height_line, _attack_option_y_pos+ymargin+(height_full*.6), _str);
		
	}
}

//draw_sprite(spr_pointer, 0, global.cam_bottom_x+xmargin+((hover - _scroll_push)*height_line)+7, _attack_option_y_pos+ymargin);

if(visible_options_max < array_length(options))and(hover < array_length(options)-1){
	draw_sprite(spr_down_arrow,0, global.cam_bottom_x+width_full+0.5, _attack_option_y_pos+height_full - 7);
}

