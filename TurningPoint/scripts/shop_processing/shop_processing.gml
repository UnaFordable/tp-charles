// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shop_processing(_shop_array){
	instance_deactivate_all(false);
	instance_create_depth(x, y, -9999, obj_SHOP, {shop_array: _shop_array});
	
}