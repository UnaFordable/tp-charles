/// @description Insert description here
// You can write your code in this editor

try{
	timing = 5;
	var _party = global.party[obj_menu_overworld.m_character_selected];
	var _item = global.inventory[obj_menu_overworld.m_item_seleted][0];
	_item.func(_party,[_party]);
}
catch(DoConv){
	
}