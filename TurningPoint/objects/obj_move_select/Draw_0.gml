/// @description Insert description here
// You can write your code in this editor
if (obj_battle_menu.active = true){ 
	draw_self();
	draw_set_font(fnt_ds);
	draw_text(x+4,y+2,string(button_name) + "\t" + string(ep_count));
}