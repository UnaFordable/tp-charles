/// @description Insert description here
// You can write your code in this editor
if(mouse_check_button(mb_left)){
	if(place_meeting(x,y,obj_hand)) 
		pet_state = PETSTATE.BEINGPET; 
	else
		pet_state = PETSTATE.LOOKING;
}
else{
	pet_state = PETSTATE.NORMAL;
}