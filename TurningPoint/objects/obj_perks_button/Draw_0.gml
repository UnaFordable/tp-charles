try{
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);

	draw_self();
	text_display(1, x+2, y+2, string(global.perks_index[item_id].name));
	draw_set_halign(fa_right);
	var _icon = 0;
	if(global.perks_index[item_id].assigned_character != noone){
		_icon = global.perks_index[item_id].assigned_character
	}
	else{
		_icon = 0;
	}
	//draw_text(x+78, y, string(_icon));
	
	draw_sprite(spr_perkicon,_icon,x+78, y);
	//text_display(2,x+94, y+2, string(global.inventory[item_id][1]));
}
catch(DoConv){
	
}