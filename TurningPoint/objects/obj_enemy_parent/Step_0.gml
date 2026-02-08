if(dead == false){
	var _hor = clamp(target_x - x, -1,1);
	var _ver = clamp(target_y - y, -1,1);
	move_and_collide(_hor * movement_speed, _ver * movement_speed, [tile_map, obj_enemy_parent])
}