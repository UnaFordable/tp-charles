/// @description Insert description here
// You can write your code in this editor
if(new_char_sel == obj_menu_overworld.m_character_selected){
	image_index = 0
	switch(obj_menu_overworld.background_img){
		case 0: sprite_color = $FF9D98F6; break;
		case 1: sprite_color = $FF59F6FF; break;
		case 2: sprite_color = $FF51A600; break;
		case 3: sprite_color = $FFBC7200; break;
	}
}
else{
	image_index = 1;
	sprite_color = $FFFFFF
}