if(dead == false and point_in_rectangle(x,y,global.cam_top_x, global.cam_top_y,global.cam_top_x+global.cam_width, global.cam_top_y+global.cam_height)){
	var _hor = clamp(target_x - x, -1,1);
	var _ver = clamp(target_y - y, -1,1);
	move_and_collide(_hor * movement_speed, _ver * movement_speed, [tile_map, obj_enemy_parent])
}