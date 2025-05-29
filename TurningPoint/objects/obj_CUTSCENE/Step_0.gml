/// @description Insert description here
// You can write your code in this editor
//if(initiate_cutscene = true){
	var _current_scene = scene_info[scene];
	var _len = array_length(_current_scene);

	if (_len > 0){
		script_execute_ext(_current_scene[0], _current_scene, 1, _len-1);
	}
	else
		script_execute(_current_scene[0]);
//}
/*
switch(_len){
	case 0 : script_execute(_current_scene[0]); break;
	case 1 : script_execute_ext(_current_scene[0], _current_scene, 1); break;
	case 2 : script_execute_ext(_current_scene[0], _current_scene, 2); break;
}
*/