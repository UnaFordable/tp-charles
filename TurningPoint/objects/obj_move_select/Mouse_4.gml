/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_battle_menu) and obj_battle_menu.sub_menu_level = 1){
	obj_battle_menu.hover = m_hover;
	with(obj_battle_menu){
		if(active = true){
			if(array_length(options[hover]) > 1) and (options[hover][4]==true){
				if(options[hover][2] != -1){
					var _func = options[hover][2];
					if(options[hover][3] != -1){
						script_execute_ext(_func, options[hover][3]);
						
					}
					else{
						_func();
					}
				}
			}
		}
	}
}