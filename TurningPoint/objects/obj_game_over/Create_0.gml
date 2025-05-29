/// @description Insert description here
// You can write your code in this editor

/*
Create 2 buttons: try again button and give up button
*/

instance_create_depth(global.cam_bottom_x+16, global.cam_bottom_y+16, -99999, obj_ta_button, 
{text:"Try Again!",
	s_enemies: s_enemies,
	s_inventory: s_inventory,
	s_hp: s_hp,
	bg: bg,
	action: function(){
		//global.inventory = s_inventory;
		for(var _i = 0; _i < array_length(s_inventory); _i++){
			add_item_to_inventory(s_inventory[_i], 1);
		}
		for (var _i = 0; _i < array_length(global.party); _i++){
			global.party[_i].hp = s_hp[_i];
			//global.party[_i].ep = s_ep[_i];
		}
		new_encounter(s_enemies, bg);
		instance_destroy();
		with(obj_game_over){instance_destroy();}
		with(obj_ta_button){instance_destroy()}
	}
})

instance_create_depth(global.cam_bottom_x+16, global.cam_bottom_y+32, -99999, obj_ta_button, 
{text:"Give Up!",
	action: function(){
		instance_activate_all(); 
		with(obj_game_over){instance_destroy();}
		with(obj_ta_button){instance_destroy()}
		room_goto(rm_main_menu);
	}
})