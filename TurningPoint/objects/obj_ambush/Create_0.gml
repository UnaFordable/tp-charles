/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
life_span = 30;

activated = false;
scene_info = [
	[cutscene_instance_destroy, obj_ambush],
	[new_encounter, enemy_forms]
];

direction = point_direction(x,y, obj_player.x, obj_player.y);
speed = 4;