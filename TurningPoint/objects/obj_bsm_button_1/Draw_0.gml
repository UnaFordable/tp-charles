/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(fnt_ds);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text_color(x+sprite_get_width(sprite_index)/2+1,y+16,button_text, c_grey,c_grey,c_grey,c_grey,1);
draw_text_color(x+sprite_get_width(sprite_index)/2+1,y+17,button_text, c_grey,c_grey,c_grey,c_grey,1);
draw_text_color(x+sprite_get_width(sprite_index)/2,y+16,button_text, cc,cc,cc,cc,1);
