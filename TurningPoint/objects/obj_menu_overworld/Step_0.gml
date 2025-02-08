/// @description Insert description here
// You can write your code in this editor
if(m_state == MENU.ITEMS){
	if(instance_exists(obj_item_button)){
		instance_activate_object(obj_item_button);
	}
	else{
		for(var _i = 0; _i < array_length(global.inventory); _i++){
			instance_create_depth(global.cam_bottom_x + 38, global.cam_bottom_y +48 +(_i*16), depth-1, obj_item_button, {item_id: _i});
			
		}
		instance_create_depth(global.cam_bottom_x + 176, global.cam_bottom_y +144, depth-1, obj_item_use);
	}
}
else{
	instance_deactivate_object(obj_item_button);
}