/// @description Insert description here
// You can write your code in this editor
var _transition = instance_create_layer(0, 0, "Instances", obj_transition_pixelate);
_transition.target_room = the_room;
obj_player.x = new_x;
obj_player.y= new_y;

instance_destroy();