/// @description Insert description here
// You can write your code in this editor
event_inherited();

function scene_play(){
	cutscene_begin([
	[dialogue, DISPLAY.NORMAL, {text: "What are you buying?", name : ""}],
	[shop_processing, [global.action_library.tulip, global.action_library.milk]],
	[dialogue, DISPLAY.NORMAL, {text: "Thank you come again!", name : ""}]
	]);
}