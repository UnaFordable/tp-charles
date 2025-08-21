/// @description Insert description here
// You can write your code in this editor
if(assigned_state = obj_SHOP.shop_state){
	obj_SHOP.shop_item_selected = item_ID
}
with obj_SHOP{
	for(var _i = 0; _i < array_length(global.inventory); _i++){
		if(shop_item_selected.name = global.inventory[_i][0]){
			in_bag = global.inventory[_i][1];
			exit;
		}
		else{
			in_bag = 0;
		}
	}
}