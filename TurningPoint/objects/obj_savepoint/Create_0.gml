/// @description Insert description here
// You can write your code in this editor
function scene_play(){
	cutscene_begin([
	[dialogue, DISPLAY.NORMAL, {text: "Now Saving...\nPlease do not turn of power.", name:""}],
	[cutscene_wait, 5],
	[dialogue, DISPLAY.NORMAL, {text: "Save Complete!", name: ""}]
	])
}