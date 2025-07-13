/// @description Insert description here
// You can write your code in this editor
if(obj_shop_menu.menu_level = level_def){
	draw_self();
	draw_set_font(fnt_ds);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	text_display(1, x + 2, y+2, name);
	draw_set_halign(fa_right);
	text_display(1, x-2, y+2, item_price);
}