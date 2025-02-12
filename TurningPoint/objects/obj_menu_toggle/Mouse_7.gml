/// @description Insert description here
// You can write your code in this editor
if(image_index = 1){
	image_index = 0;
	instance_deactivate_object(obj_menu_overworld);
	instance_deactivate_object(obj_omcd_button_1);
	instance_deactivate_object(obj_bsm_button_1);
	instance_deactivate_object(obj_item_button);
	
	instance_activate_object(obj_move_button);
	instance_activate_object(obj_action_button);
	
	//obj_menu_overworld.visible =false;
	//obj_omcd_button_1.visible = false;
	//obj_bsm_button_1.visible = false;
	
	//obj_move_button.visible = true;
}
else if(image_index =0){
	image_index = 1;
	instance_activate_object(obj_menu_overworld);
	instance_activate_object(obj_omcd_button_1);
	instance_activate_object(obj_bsm_button_1);
	instance_activate_object(obj_item_button);
	
	instance_deactivate_object(obj_move_button);
	instance_deactivate_object(obj_action_button);
	//obj_menu_overworld.visible =true;
	//obj_omcd_button_1.visible = true;
	//obj_bsm_button_1.visible = true;
	
	//obj_move_button.visible = false;
}