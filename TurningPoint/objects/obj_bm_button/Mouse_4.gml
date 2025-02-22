/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_battle_menu)){
	with(obj_battle_menu){
		if(active = true){
			if(array_length(options[hover]) > 1) and (options[hover][3]==true){
				if(options[hover][1] != -1){
					var _func = options[hover][1];
					if(options[hover][2] != -1){
						script_execute_ext(_func, options[hover][2]);
					}
					else{
						_func();
					}
				}
			}
		}
	}
}