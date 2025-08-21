/// @description Insert description here
// You can write your code in this editor
text_display( 2,global.cam_bottom_x + 212,global.cam_bottom_y +136,quantity);
text_display( 1,global.cam_bottom_x + 212,global.cam_bottom_y +136,item_desc);
text_display(1,global.cam_bottom_x + 180,global.cam_bottom_y +42, "In Bag:");
text_display(1,global.cam_bottom_x + 240,global.cam_bottom_y +42,in_bag);
text_display(2, global.cam_bottom_x + 180,global.cam_bottom_y +16,string(global.currency.count)+" "+global.currency.name);


//try{
	
//}
//catch(DoConv){}

//switch shop_state {
	//case SHOPSTATE.BUY:
		var _item = shop_item_selected;
		text_display(1,global.cam_bottom_x + 196, global.cam_bottom_y + 60, string(_item.info));
	//	break;
	//case SHOPSTATE.SELL:
		//text_display(1, 80, 64, "Goodbye");
	//	break;
//}
//draw_text(x,y,test);