/// @description Insert description here
// You can write your code in this editor

switch(name){
	case "Buy":
		obj_SHOP.shop_state = SHOPSTATE.BUY; 
		obj_SHOP.test++;
		break;
	case "Sell":
		obj_SHOP.shop_state = SHOPSTATE.SELL; 
		obj_SHOP.test++;
		break;
}

//script_execute(button_func);
