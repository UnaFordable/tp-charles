/// @description Insert description here
// You can write your code in this editor
switch obj_pet_body.pet_state{
	case PETSTATE.BEINGPET:
		image_index = 1;
		break;
	case PETSTATE.NORMAL:
		image_index = 0;
		break;
	case PETSTATE.LOOKING:
		image_index = 3;
}