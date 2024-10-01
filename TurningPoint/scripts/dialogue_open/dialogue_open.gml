function dialogue(_dialogue_type, _text_set){
	if(!instance_exists(obj_dialogue))instance_create_depth(0,0, -99999, obj_dialogue);
	with(obj_dialogue){
		text_set = _text_set;
		display_state = _dialogue_type;
	}
	
}