scene_info = [
	//[cutscene_expression, obj_player, spr_exclamation],
	//[cutscene_wait, .],
	[move_character, obj_player,  1560, 600, false, 1.5],
	[move_character, obj_player,  0, 2, true, 1.5],
	[cutscene_wait, .45],
	[move_character, obj_player,  0, -4, true, 1.5],
	[cutscene_wait, .45],
	[move_character, obj_player,  0, 2, true, 1.5],
	[dialogue, DISPLAY.NORMAL, {text: "That snail should be hiding here. You check the \ntrees, and I'll check the bushes.", name: "Baxter"}],
	[new_encounter, [global.enemies.possessed_lyraka]]
	//[cutscene_instance_create,]
]