/// @description Insert description here
// You can write your code in this editor
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_self();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

switch(obj_menu_overworld.m_state){
	case MENU.ITEMS:
		text_display(1,x+ sprite_width/2,y+ sprite_height/2, "USE");
		break;
	case MENU.PERKS:
		if(global.perks_index[obj_menu_overworld.m_item_seleted].assigned_character != noone)
			text_display(1,x+ sprite_width/2,y+ sprite_height/2, "UNEQUIP");
		else
			text_display(1,x+ sprite_width/2,y+ sprite_height/2, "EQUIP");
		break;
}
