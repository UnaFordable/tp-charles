/// @description Insert description here
// You can write your code in this editor
try{
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);

	draw_self();
	text_display(1, x+2, y+2, string(global.inventory[item_id][0].name));
	draw_set_halign(fa_right);
	text_display(2,x+94, y+2, string(global.inventory[item_id][1]));
}
catch(DoConv){
	
}