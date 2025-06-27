/// @description Insert description here
// You can write your code in this editor
if(mouse_check_button(mb_left)){
	x= mouse_x;
	y= mouse_y;
	if(place_meeting(x,y,obj_pet_body)){ 
		image_index = 1;
	}
	else{
		image_index = 0;
	}
}
else{
	image_index = 0;
	x= -64;
	y = -64;
}