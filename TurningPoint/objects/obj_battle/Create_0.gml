/// @description Insert description here
// You can write your code in this editor

randomize();

transition_prog = 0;
surf_transition = surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
surface_copy(surf_transition,0,0,application_surface);
instance_deactivate_all(true)
//instance_create_depth(global.cam_top_x, global.cam_top_y+128,depth-11, obj_filmbackground, {angle: 0});
//instance_create_depth(global.cam_top_x+256, global.cam_top_y+16,depth-11, obj_filmbackground, {angle: 180});
units = [];
turn = 0;
unit_turn_order = [];
unit_render_order = [];


battle_text = "";
battle_end_message = [];
battle_end_message_prog = 0;
battle_xp_gained = 0;
conclusion_type = -1;
escaped = false;

turn = 0;
turn_count = 0;
round_count = 0;
battle_wait_for_menu = false;
battle_wait_time_frames = 45;
battle_wait_time_remaining = 0;
current_user = noone;
current_action = -1;
current_targets = noone;

cursor = {
	active_user: noone,
	active_target: noone,
	active_error: false,
	active_action: -1,
	target_side: -1,
	target_index: 0,
	target_all: false,
	confirm_delay: 0,
	active: false
}
// stashe the ccurrent enemies and user's inventory
stashed_enemies = enemies;
stashed_inventory = [];
//

stashed_hp = [];
stashed_ep = [];


//Make enemies
for (var _i = 0; _i < array_length(enemies); _i++){
	enemy_units[_i]= instance_create_depth(global.cam_top_x+207-((_i mod 3)*30)+((_i div 3)*40), global.cam_top_y+(16*6), depth-10, obj_battle_unit_enemy, enemies[_i])
	array_push(units, enemy_units[_i]);
}

//Make party
for (var _i = 0; _i < array_length(global.party); _i++){
	party_units[_i]= instance_create_depth(global.cam_top_x+40+((_i mod 4)*(16*2.5)), global.cam_top_y+(16*9), depth-10, obj_battle_unit_pc, global.party[_i])
	array_push(units, party_units[_i]);
}
//Stash party HP and EP
for (var _i = 0; _i < array_length(party_units); _i++){
	stashed_hp[_i] = party_units[_i].hp;
	stashed_ep[_i] = party_units[_i].ep;
}

unit_turn_order = array_shuffle(units);

refresh_render_order = function(){
	unit_render_order = [];
	array_copy(unit_render_order, 0, units, 0, array_length(units));
	array_sort(unit_render_order, function(_1, _2){return _1.y-_2.y});
}
refresh_render_order();

function battle_state_select_action(){
	if(!instance_exists(obj_battle_menu) and !instance_exists(obj_dialogue)){
		var _unit = unit_turn_order[turn];
		//Is the unit alive and able to act
		if(instance_exists(_unit)) and (_unit.hp > 0){
			//Reser any one turn effects
			_unit.defending = false;
			//Player
			if(_unit.enemy == false){
				//Compile action menu
				var _menu_options = [];
				var _sub_menus = {};
				//add inventory to actions list
				var _inventory_actions = [];
				//for every item in the inventory
				for (var _i = 0; _i < array_length(global.inventory); _i++)
				{
				//if we have any of this item left we want to add the to the action list
					if (global.inventory[_i][1] > 0){
						var _item_action = global.inventory[_i][0];
						_item_action.count = global.inventory[_i][1];
						array_push(_inventory_actions, _item_action); 
					}
				}
				
				var _action_list = array_union(_unit.actions, _inventory_actions);
				for(var _i = 0; _i < array_length(_action_list); _i++){
					var _action = _action_list[_i];
					var _available = is_action_available(_unit, _action);
				//Add item count to option name
					var _name = _action.name;
					var _count = 0;
					if(_action.sub_menu == "Items"){
						_count = _action.count;
					}
					else if(_action.sub_menu == "Skills"){
						_count = _action.ep_cost;
					}
					// if the option is the primary option, push first to the menu_options
					if(_action.sub_menu == -1){
						array_push(_menu_options, [_name, _count, menu_select_action, [_unit, _action], _available]);
					}
					else{
						// push the sub menus to options_arrays
						if(is_undefined(_sub_menus[$ _action.sub_menu])){
							variable_struct_set(_sub_menus, _action.sub_menu, [[_name, _count, menu_select_action, [_unit, _action], _available]]);
						}
						else{
							array_push(_sub_menus[$ _action.sub_menu], [_name, _count, menu_select_action, [_unit, _action], _available]);
						}
					}
				}
				var _sub_menu_array = variable_struct_get_names(_sub_menus);
				for(var _i = 0; _i < array_length(_sub_menu_array); _i++){
					//array_push(_sub_menus[$ _sub_menu_array[_i]], ["Back", menu_go_back, -1, true]);
					array_push(_menu_options, [_sub_menu_array[_i], 0, sub_menu, [_sub_menus[$ _sub_menu_array[_i]]], true]);
				}
				
				array_sort(_menu_options, function(_a, _b){
					var _priority = function(_option)
					{
						if (_option[0] == "Fight") return -7;
						if (_option[0] == "Skills") return -8;
						if (_option[0] == "Items") return -9;
						if (_option[0] == "Flee") return -10;
						return 0;
					}
					return _priority(_b) - _priority(_a);
				});
				// Finally display the menu with options
				menu(global.cam_bottom_x + 10, global.cam_bottom_y +110, _menu_options, ,60,60);
			}
			else{
				var _enemy_action = _unit.AIscript();
				if(_enemy_action != -1){
					begin_action(_unit.id, _enemy_action[0], _enemy_action[1]);
				}
			}
		}
		else{
			battle_state = battle_state_turn_progression;
		}
		
	}
}

function begin_action(_user, _action, _targets){
	current_user = _user;
	current_action = _action;
	current_targets = _targets;
	if(!is_array(current_targets)){
		current_targets = [current_targets];
	}
	//battle_text = string_ext(_action.description, [_user.name]);
	if(!instance_exists(obj_next_button))instance_create_depth(global.cam_bottom_x+42, global.cam_bottom_y+142, depth-1, obj_next_button);
	dialogue(DISPLAY.OVERHEAD,{text: string_ext(_action.description, [_user.name]),name:""});
	battle_wait_time_remaining = battle_wait_time_frames;
	with(_user){
		acting = true;
		if (_action.sub_menu == "Item"){
			remove_item_from_inventory(_action, 1);
		}
		//play user animation if it is defined for that action, and that user
		if  (!is_undefined(_action[$ "userAnimation"])) and (!is_undefined(_user.sprites[$ _action.user_animation])){
			sprite_index = sprites[$ _action.user_animation];
			image_index = 0;
		}
	}
	battle_state = battle_state_perform_action;
	
}

function battle_state_perform_action(){	
	// If animation is still playing
	if(current_user.acting){
		//When it ends, perform actoin effect if it exists
		if(current_user.image_index >= current_user.image_number-1){
			with(current_user){
				sprite_index = sprites.idle;
				image_index = 0;
				acting = false;
			}
			if(variable_struct_exists(current_action, "effect_sprite")){
				if(current_action.effect_on_target == MODE.ALWAYS) or ((current_action.effect_on_target == MODE.VARIES) and (array_length(current_targets) <= 1)){
					for(var _i = 0; _i < array_length(current_targets); _i++){
						instance_create_depth(current_targets[_i].x, current_targets[_i].y, current_targets[_i].depth-1, obj_battle_effect, {sprite_index: current_action.effect_sprite});
					}
				}
				else{
					var _effect_sprite = current_action.effect_sprite;
					if(variable_struct_exists(current_action, "effect_sprite_no_target")){
						_effect_sprite = current_action.effect_sprite_no_target;
					}
					instance_create_depth(global.cam_top_x, global.cam_top_y, depth -100, obj_battle_effect, {sprite_index: _effect_sprite});
					
				}
			}
			current_action.func(current_user, current_targets);
		}
	}
	else{
		if(!instance_exists(obj_battle_effect)){
			battle_wait_time_remaining --;
			if(battle_wait_time_remaining == 0){
				battle_state = battle_state_victor_check;
			}
		}
	}
}

function battle_state_victor_check(){
	//Is the battle over?
	var _end_the_battle = false;
	var _no_enemies_alive = !array_any(enemy_units, function(_unit){ return (_unit.hp > 0);});
	var _no_party_alive = !array_any(party_units, function(_unit){ return (_unit.hp > 0);});
	
	//Player lose overrides win
	//Lose check
	if (_no_party_alive)
	{
		_end_the_battle = true;
		conclusion_type = 0;
		//battle_end_messages[0] = "All party members defeated!";
		//battle_end_messages[1] = "Game over...";
		dialogue(DISPLAY.OVERHEAD,{text: "All party members defeated!",name:""});
		dialogue(DISPLAY.OVERHEAD,{text: "...",name:""});
		//instance_create_depth(x,y,depth-10, obj_game_over);
		
	}
	else
	{
		//Win check
		if (_no_enemies_alive)
		{
			
			conclusion_type = 1;
			_end_the_battle = true;
			//battle_end_messages[0] = "Victory!!";
			dialogue(DISPLAY.OVERHEAD,{text: "Victory!",name:""});
			audio_stop_all();
			//audio_play_sound(_065___Victorious__, 1, false);
			for (var _i = 0; _i < array_length(enemy_units); _i++)
			{
				battle_xp_gained += enemy_units[_i].xp_value;
			}
			//battle_end_messages[1] = string("Gained {0} experience points", battle_xp_gained);
			dialogue(DISPLAY.OVERHEAD,{text: string("Gained {0} experience points", battle_xp_gained),name:""});
			recieve_exp(battle_xp_gained);
			//distribute exp
			
		}
	}
	
	//Escaped
	if (escaped)
	{
		conclusion_type = 2;
		_end_the_battle = true;
		//battle_end_messages[0] = "Escaped!"
		//battle_end_messages[1] = "No experience gained."
		dialogue(DISPLAY.OVERHEAD,{text:"Escaped!",name:""});
		dialogue(DISPLAY.OVERHEAD,{text:"No experenced gained.",name:""});
		
	}

	battle_state = _end_the_battle ? battle_state_ending : battle_state_turn_progression;
}

function battle_state_turn_progression(){
	battle_text = "";
	turn_count ++;
	turn ++;
	if(turn > array_length(unit_turn_order) -1){
		turn = 0;
		round_count ++;
	}
	//Add EP to prepare next turn
	if(unit_turn_order[turn].enemy == false) and (unit_turn_order[turn].id.ep < unit_turn_order[turn].id.ep_max){
		unit_turn_order[turn].id.ep += 1;
	}
	battle_state = battle_state_select_action;
}
	
function battle_state_ending(){
	if(!instance_exists(obj_dialogue))//if (battle_end_message_prog >= array_length(battle_end_messages))
	{
		transition_prog -= 0.01;
		if (transition_prog <= 0.0)
		{
			instance_destroy();
			
			audio_stop_all();
		}
	}
	else
	{
	//	battle_text = battle_end_messages[battle_end_message_prog];
		
	}
}
	
function battle_state_begin(){
	//battle_text = "Ka...";
	transition_prog += 0.01;
	if(transition_prog >= 1){
		transition_prog = 1;
		/*
		dialogue(DISPLAY.OVERHEAD,{text:"Sea Snail Takeover!",name:"Shelly"});
		dialogue(DISPLAY.OVERHEAD,{text:"HAHAHAHAHAHA AHH!",name:"Shelly"});
		dialogue(DISPLAY.OVERHEAD,{text:"Step back before things get violent!",name:"Shelly"});
		dialogue(DISPLAY.OVERHEAD,{text:"Get off Lyraka! You freaky snail!",name:"Baxter"});
		dialogue(DISPLAY.OVERHEAD,{text:"This body is perfect! No one else can have it!",name:"Shelly"});
		*/
		battle_state = battle_state_select_action;
	}
	instance_create_depth(global.cam_bottom_x+42, global.cam_bottom_y+142, -99999, obj_next_button);
}

battle_state = battle_state_begin;