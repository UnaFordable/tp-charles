/// @description Insert description here
// You can write your code in this editor
shop_array = [];
test  = 0;
enum SHOPSTATE {
	NONE,
	BUY,
	SELL
}
shop_state = SHOPSTATE.BUY;
//Create the buy button and define variables
instance_create_depth(global.cam_bottom_x + 48, global.cam_bottom_y+8, -9999, obj_shop_button, 
	{image_xscale: 3, image_yscale:1.5, name: "Buy", 
			button_func : function(){ 
				obj_SHOP.shop_state = SHOPSTATE.BUY; 
				obj_SHOP.test++;}});
//Create the sell button and define variables 
instance_create_depth(global.cam_bottom_x + 104, global.cam_bottom_y+8, -9999, obj_shop_button, 
	{image_xscale: 3, image_yscale:1.5, name: "Sell", 
			button_func : function(){ with obj_SHOP  shop_state = SHOPSTATE.SELL;}});
//instance_create_depth(global.cam_bottom_x + 168, global.cam_bottom_y+8, -9999, obj_shop_button, 
//	{image_xscale: 3, image_yscale:1.5, name: "Back", level_def: 1, 
//			button_func : function(){if(global.shop_menu_level != 0){global.shop_menu_level = 0;}}});
instance_create_depth(global.cam_bottom_x + 184, global.cam_bottom_y+152, -9999, obj_shop_button, 
	{image_xscale: 3.5, image_yscale:1.5, name: "Confirm", 
			button_func : function(){}});
instance_create_depth(global.cam_bottom_x + 4, global.cam_bottom_y+4, -9999, obj_shop_button, 
	{image_xscale: 1, image_yscale:1, name: "X", 
		button_func : function(){
			instance_activate_all();
			with(obj_shop_button){
				instance_destroy()
			}
			with(obj_shop_item_button){
				instance_destroy();
			}
			with obj_SHOP instance_destroy();
			if(instance_exists(obj_CUTSCENE)){ with(obj_CUTSCENE) cutscene_end_action();}
		}});	
for(var _i = 0; _i < array_length(shop_array); _i++){
	instance_create_depth(global.cam_bottom_x + 8, global.cam_bottom_y+40+(_i*20), -9999, obj_shop_item_button, 
	{name : shop_array[_i].name, item_price : shop_array[_i].price});
}
	
