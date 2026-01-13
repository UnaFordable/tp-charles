/// @description Insert description here
// You can write your code in this editor

if(contest_phase = 1){
	 if(!instance_exists(obj_accessory)){
		 var box_x = 8;
		 var box_width = sprite_get_width(spr_contest_dressup_background);
		 var box_y = 16;
		 var box_height = sprite_get_height(spr_contest_dressup_background);
		 for(var _i = 0; _i < array_length(global.fashion_case); _i ++){
			 var accessory = global.fashion_case[_i];
			 var sprite_radius_w = sprite_get_width(accessory.sprite)/2;
			 var sprite_radius_h = sprite_get_height(accessory.sprite)/2;
			 var x_min = box_x + sprite_radius_w;
			 var x_max = box_width - sprite_radius_w;
			 var y_min = box_y + sprite_radius_h;
			 var y_max = box_height - sprite_radius_h
			 //if current_section = accessory.section{
				 instance_create_depth(irandom_range(x_min, x_max), irandom_range(y_min, y_max), depth, obj_accessory, 
				 {name: accessory.name, sprite_index: accessory.sprite, image_index : accessory.frame});
			 //}
		 }
	 }
}