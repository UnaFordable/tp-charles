/// @description Insert description here
// You can write your code in this editor
if(m_state == MENU.ITEMS){
	if(!instance_exists(obj_item_button)){
		for(var _i = 0; _i < array_length(global.inventory); _i++){
			instance_create_depth(global.cam_bottom_x + 38, global.cam_bottom_y +40 +(_i*16), depth-1, obj_item_button, {item_id: _i});
		}
		instance_create_depth(global.cam_bottom_x + 176, global.cam_bottom_y +144, depth-1, obj_item_use);
	}
	/*
	if(instance_exists(obj_item_button)){
		instance_activate_object(obj_item_button);
		if(instance_number(obj_item_button) < array_length(global.inventory)){
			var below_last_button = instance_number(obj_item_button) * 16
			var _remainer = array_length(global.inventory) - instance_number(obj_item_button);
			for(var _i = 0; _i < _remainer; _i ++){
				instance_create_depth(global.cam_bottom_x+ 38, global.cam_bottom_y + 40+(below_last_button), depth-1, 
				obj_item_button, {item_id: _i})
			}
		}
	}
	else{
		for(var _i = 0; _i < array_length(global.inventory); _i++){
			instance_create_depth(global.cam_bottom_x + 38, global.cam_bottom_y +40 +(_i*16), depth-1, obj_item_button, {item_id: _i});
		}
		instance_create_depth(global.cam_bottom_x + 176, global.cam_bottom_y +144, depth-1, obj_item_use);
	}
	*/
}
else{
	with(obj_item_button){instance_destroy();}
}