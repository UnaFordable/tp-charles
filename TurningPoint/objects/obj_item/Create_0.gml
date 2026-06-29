/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

function scene_play(){
	cutscene_begin(
	[[cutscene_instance_destroy, id],
	[dialogue, DISPLAY.NORMAL, {text: string_ext("You found {0} {1}", [string(item_count), chest_item.name]), name:""}],
	[add_item_to_inventory, chest_item, item_count]
	])
}