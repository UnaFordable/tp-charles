function scene_play(){
	dialogue(DISPLAY.NORMAL,{text:"You put the item in your bag.", name:""});
	add_item_to_inventory(global.action_library.tulip, 1);
}