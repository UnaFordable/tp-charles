/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_dialogue) and instance_exists(obj_battle)){
	draw_self();
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	text_display(1,x+ sprite_width/2,y+ sprite_height/2, ">>>");
}
