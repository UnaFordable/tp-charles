/// @description Insert description here
// You can write your code in this editor
if (obj_battle_menu.active = true and obj_battle_menu.sub_menu_level = 1){ 
	draw_self(); 
	draw_set_font(fnt_ds);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_text(x+4,y+4,string(button_name));
	draw_set_valign(fa_top);
	draw_set_halign(fa_right); 
	draw_text(x+94,y+2, string(m_count));
	
}