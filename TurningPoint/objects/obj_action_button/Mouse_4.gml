/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_dialogue))
{
	obj_dialogue.next_step = true;
}
else{obj_player.key_action = true;}