/// @description Insert description here
// You can write your code in this editor
	//draw_sprite_stretched(sprite_index, 0, x,y, spr_w, 18);
	draw_self();
	draw_set_font(fnt_ds);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	text_display(1, x+(sprite_width/2), y+(sprite_height/2), name);
