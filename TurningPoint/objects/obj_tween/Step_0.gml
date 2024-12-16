/// @description Insert description here
// You can write your code in this editor
if(sequence_frame >= sequence_pause){
	sequence_frame = sequence_pause;
	layer_sequence_pause(seq);
}
//else if(sequence_frame == layer_sequence_get_length(seq)){
//	instance_destroy();
//}
else{
	sequence_frame++;
	layer_sequence_play(seq);
}
if(instance_exists(obj_player)){
	if(obj_player.key_action){
		if(obj_dialogue.pendingnum == 0){
			instance_destroy();
			layer_destroy(layer_seq);
		}
		else{
			sequence_pause += pending_pause[1];
			for(var _i = 0; _i < obj_dialogue.pendingnum; _i++){
				pending_pause[_i] = pending_pause[_i+1];
			}
		}
	}
}