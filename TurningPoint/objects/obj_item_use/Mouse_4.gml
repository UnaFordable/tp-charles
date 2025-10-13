/// @description Insert description here
// You can write your code in this editor

try{
	timing = 5;
	var _party = global.party[obj_menu_overworld.m_character_selected];
	var _item = global.inventory[obj_menu_overworld.m_item_seleted][0];
	var _perks = global.perks_index[obj_menu_overworld.m_item_seleted];
	switch(obj_menu_overworld.m_state){
		case MENU.ITEMS:
			_item.func(_party,[_party]);
			break;
		case MENU.PERKS:
			if(array_contains(_party.perks, _perks))
				array_push(_party.perks, _perks);
			else
				array_delete(_party.perks, array_get_index(_party.perks, _perks), 1);
			break;
	}
}
catch(DoConv){
	
}