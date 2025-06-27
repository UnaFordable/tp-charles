/// @description Insert description here
// You can write your code in this editor
instance_create_depth(x, y, depth -1, obj_pet_face);
instance_create_depth(0,0, depth-4, obj_hand);
instance_create_depth(x - 8,y-12, depth -2, obj_eye);
instance_create_depth(x + 8,y-12, depth -2, obj_eye);

image_index = 0;

enum PETSTATE {
	NORMAL,
	LOOKING,
	BEINGPET,
	HAPPY
}
pet_state = PETSTATE.BEINGPET;
