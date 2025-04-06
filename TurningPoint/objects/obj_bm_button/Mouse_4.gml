/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_battle_menu) and obj_battle_menu.sub_menu_level = 0){
	obj_battle_menu.hover = m_hover;
	with(obj_battle_menu){
		if(active = true){
			if(array_length(options[hover]) > 1) and (options[hover][3]==true){
				if(options[hover][1] != -1){
					var _func = options[hover][1];
					if(options[hover][2] != -1){
						script_execute_ext(_func, options[hover][2]);
						/// Create new options for moves
						if(!instance_exists(obj_move_select)){
							for(var _i = 0; _i < array_length(options); _i ++){
								instance_create_depth(global.cam_bottom_x+8,global.cam_bottom_y+64+(_i*18),depth, obj_move_select, {m_hover : _i, button_name: options[_i][0], m_count: options[_i][1]})
							}
						}
						///
					}
					else{
						_func();
					}
				}
			}
		}
	}
}