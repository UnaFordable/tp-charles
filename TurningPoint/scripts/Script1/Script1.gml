// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function char_stats(){
	enum MODE{
		NEVER = 0,
		ALWAYS = 1,
		VARIES = 2,
	}

	
	global.action_library = {
		#region PHYSICAL ATTACKS
		punch: {
			name: "Attack",
			info: "",
			description: "{0} throws a punch!",
			sub_menu: -1,
			ep_cost: 0,
			target_required: true,
			target_enemy_by_default: true,
			target_all: MODE.NEVER,
			user_animation: "attack",
			effect_sprite: spr_scratch,
			effect_on_target: MODE.ALWAYS,
			func: function(_user, _targets){
				var _damage = clamp(ceil((_user.attack)*1.5-(_targets[0].defense) + 1), 1, 9999);
				battle_change_hp(_targets[0], -_damage+choose(0,1), 0);
			}
		},
		roll: {},
		#endregion
		
		#region SKILLS
		block:{
			name: "Block",
			info: "",
			description: "{0} blocks!",
			sub_menu: "Skills",
			ep_cost: 1,
			target_required: false,
			func: function(_user, _targets){
				_user.defending = true;
				_user.ep -= ep_cost;
			}
		},
		run: {
			name:"Run",
			info: "Chance to end battle with no exp earned",
			description: "Ran away!!",
			sub_menu: "Flee",
			target_required: false,
			func: function(){
				if (random(1) < 0.8){
					obj_battle.escaped = true;
				}
				else{
					dialogue(DISPLAY.OVERHEAD,{text:"It didn't work...",name:""});
				}
			}
		},
		#region LUSAKA MOVESET
		spin_attack:{
			name: "Head Slash",
			info: "Throw head with sharp edge attached",
			description: "{0} makes a lethal bow!",
			sub_menu: "Skills",
			ep_cost: 1,
			target_required: true,
			target_enemy_by_default: true,
			target_all: MODE.ALWAYS,
			user_animation: "attack",
			effect_sprite: spr_scratch,
			effect_on_target: MODE.ALWAYS,
			func: function(_user, _targets){
				var _damage = clamp(ceil(4*(_user.attack)-(2*_targets[0].defense) + irandom_range(0,1)), 1,10);
				battle_change_hp(_targets[0], -_damage, 0);
				_user.ep -= ep_cost;
			}
		},
		fart_attack:{
			name: "Fart Atk",
			info: "Bast of gas",
			description: "{0} farts towards the enemy",
			sub_menu: "Skills",
			ep_cost: 2,
			target_required: true,
			target_enemy_by_default: true,
			target_all: MODE.ALWAYS,
			user_animation: "attack",
			effect_sprite: spr_puff_of_smoke,
			effect_on_target: MODE.ALWAYS,
			func: function(_user, _targets){
				var _damage = ceil(irandom_range(1,4)*(_user.attack) + irandom_range(0,1));
				battle_change_hp(_targets[0], -_damage, 0);
				_user.ep -= ep_cost;
			}
		},
		#endregion
		#region BAXTER MOVESET
		rub: {
			name: "Heal Rub",
			info: "Touch technique to treat wounds",
			description: "{0} gives rubs!",
			sub_menu: "Skills",
			ep_cost: 3,
			target_required: true,
			target_enemy_by_default: false,
			target_all: MODE.NEVER,
			func: function(_user, _targets){
				var _heal = ceil(1.5*_user.attack+irandom_range(1,4));
				battle_change_hp(_targets[0], _heal);
				_user.ep -= ep_cost;
			}
		},
		#endregion
		#region DONOHUE MOVESET
		manshot: {
			name: "Wing Whip",
			info: "Use your wing to deal damage.",
			description: "{0} whips its wing!",
			sub_menu: "Skills",
			ep_cost: 2,
			target_required: true,
			target_enemy_by_default: true,
			target_all: MODE.NEVER,
			user_animation: "attack",
			effect_sprite: spr_scratch,
			effect_on_target: MODE.ALWAYS,
			func: function(_user, _targets){
				var _damage = ceil(2.5*(_user.attack)-(1.5*_targets[0].defense));
				battle_change_hp(_targets[0], -_damage, 0);
				_user.ep -= ep_cost;
			}
		},
		#endregion
		#region MANAGUA MOVESET
		slime_spit:{
			name: "Slime Spit",
			info: "Use bits of yourself to deal damage.",
			description: "{0} spits slime!",
			sub_menu: "Skills",
			ep_cost: 0,
			target_required: true,
			target_enemy_by_default: true,
			target_all: MODE.NEVER,
			user_animation: "attack",
			effect_sprite: spr_splash,
			effect_on_target: MODE.ALWAYS,
			func: function(_user, _targets){
				var _damage = ceil(4*(_user.attack)-(2*_targets[0].defense) + irandom_range(0,1));
				battle_change_hp(_targets[0], -_damage, 0);
				battle_change_hp(_user, -(_damage/2), 0);
			}
		},
		#endregion
		#region REGULANA MOVESET
		heartburn: {
			name: "Heart Burn",
			info: "",
			description:"{0} casts heart burn!",
			sub_menu: -1,
			ep_cost: 0,
			target_required: true,
			target_enemy_by_default: true,
			target_all: MODE.NEVER,
			user_animation: "attack",
			effect_sprite: spr_scratch,
			effect_on_target: MODE.ALWAYS,
			func: function(_user, _targets){
				var _damage = ceil(8*(_user.attack)-(2*_targets[0].defense) + irandom_range(0,1));
				battle_change_hp(_targets[0], -_damage, 0);
			}
		},
		#endregion
		#endregion
		
		#region ITEMS
		tulip:{
			name: "Tulip",
			info: "A sweet treat\n+20 HP",
			description: "{0} ate a tulip!",
			price: 10,
			sub_menu: "Items",
			target_required: true,
			target_enemy_by_default: false,
			target_all: MODE.NEVER,
			func : function(_user, _targets){
				var _heal = 20;
				battle_change_hp(_targets[0], _heal);
				remove_item_from_inventory(global.action_library.tulip,1);
			}
		},
		milk:{
			name: "Milk",
			info: "A sweet drink\n+10 NRG",
			description: "{0} drank milk!",
			price: 20,
			sub_menu: "Items",
			target_required: true,
			target_enemy_by_default: false,
			target_all: MODE.NEVER,
			func : function(_user, _targets){
				var _heal_ep = 10;
				battle_change_ep(_targets[0], _heal_ep);
			}
		},
		
		potion:{
			name : "Potion",
			info: "Revitalizing!.\nRevives an ally",
			description : "{0} uses a Potion!",
			price: 20,
			sub_menu : "Items",
			target_enemy_by_default: false, //0: party/self, 1: enemy
			target_all: MODE.NEVER,
			target_required: true,
			func : function(_user, _targets){
				var _heal = 20;
				battle_change_hp(_targets[0], _heal, 1);
			}	
		}
		#endregion
	};
		
	global.perks_index = [
	{
		
		index: 1,
		name: "HP up",
		desc: "+10 hp",
		assigned_character: noone,
		func: function(_user){_user.hp_max += 10;}
	},
	{
		index: 2,
		name: "ATK up",
		desc: "+3 attack",
		assigned_character: noone,
		func: function(_user){_user.attack += 3;}
	}]
	#region MAIN PARTY
	global.party = [
	{
		
		name: "Lyraka",
		level:	    8,
		//BASE STATS
		hp_max_BASE:	 95,
		ep_max_BASE:     85,
		attack_BASE:     109,
		defense_BASE:    105,
		special_BASE:    75,
		spd_BASE:        56,
		//ACTUAL STATS
		hp:		    43,//43
		hp_max:	    10, //19
		ep:		    19,
		ep_max:     2,
		attack:     6,
		defense:    6,
		special:    4,
		spd:        3,
		experience: 99,
		exp_max:    100,
		sprites :{walk: spr_lusaka_walk, idle: spr_Lyraka_bat_bak, knockout: spr_rip},
		actions: [global.action_library.punch, global.action_library.spin_attack, global.action_library.run],
		perks: [],
		max_perks: 2
	},
	{
		name: "Baxter",
		level:      7,
		//BASE STATS
		hp_max_BASE:	 76,
		ep_max_BASE:     71,
		attack_BASE:     104,
		defense_BASE:    71,
		special_BASE:    104,
		spd_BASE:        108,
		//ACTUAL STATS
		hp:         40, //40
		hp_max:     10, //18
		ep:         18,
		ep_max:     6,
		attack:     5,
		defense:    4,
		special:    5,
		spd:        3,
		experience: 0,
		exp_max:    100,
		sprites: {walk: spr_baxter_walk, idle: spr_bax_bat_bak, knockout: spr_rip},
		actions: [global.action_library.punch, global.action_library.rub, global.action_library.run],
		perks: [],
		max_perks: 3
	},
	/*{
		name: "Donohue",
		level:      5,
		//BASE STATS
		hp_max_BASE:	 84,
		ep_max_BASE:     101,
		attack_BASE:     86,
		defense_BASE:    88,
		special_BASE:    111,
		spd_BASE:        60,
		//ACTUAL STATS
		hp:         1,
		hp_max:     20,
		ep:         1,
		ep_max:     6,
		attack:     8,
		defense:    2,
		special:    5,
		spd:        2,
		experience: 0,
		exp_max:    3,
		sprites :{walk: spr_baxter_walk, idle: spr_Dono_bat_back, attack: spr_donohue_idle, dodge: spr_donohue_idle, knockout: spr_rip, defend: spr_donohue_idle},
		actions: [global.action_library.punch, global.action_library.manshot],
		perks:[]
	},
	{
		name: "Shelly",
		level:      1,
		hp:         300,
		hp_max:     300,
		ep:         0,
		ep_max:     0,
		attack:     8,
		defense:    2,
		special:    20,
		spd:        2,
		experience: 0,
		exp_max:    3,
		sprites :{walk: spr_baxter_walk, idle: spr_shel_bat_bak, attack: spr_shelly_idle, dodge: spr_shelly_idle, knockout: spr_rip, defend: spr_shelly_idle},
		actions: [global.action_library.punch, global.action_library.slime_spit, global.action_library.run],
		perks: []
	}*/
	]
#endregion



	#region ALL EMEMIES
	global.enemies = {
		#region Basic enemies
		buck_o:{
			name: "Buck O'",
			hp: 20,
			hp_max: 20,
			attack: 10,
			defense: 10,
			spd: 2,
			role: "COMMON",
			sprites: {idle: spr_buck_o_idle, defend: spr_buck_o_idle},
			actions: [global.action_library.punch],
			xp_value: 16,
			AIscript: function(){
				var _action = actions[0];
				var _possible_targets = array_filter(obj_battle.party_units, function(_unit, _index){return(_unit.hp > 0);});
				var _target = _possible_targets[irandom(array_length(_possible_targets)-1)];
				return [_action, _target];
			}
		},
		buck_e:{
			name: "Buck E'",
			hp: 20,
			hp_max: 20,
			attack: 10,
			defense: 10,
			spd: 2,
			role: "COMMON",
			sprites: {idle: spr_buck_e_idle, defend: spr_buck_e_idle},
			actions: [global.action_library.punch],
			xp_value: 18,
			AIscript: function(){
				var _action = actions[0];
				var _possible_targets = array_filter(obj_battle.party_units, function(_unit, _index){return(_unit.hp > 0);});
				var _target = _possible_targets[irandom(array_length(_possible_targets)-1)];
				return [_action, _target];
			}
		},
		buck_l:{
			name: "Buck L'",
			hp: 20,
			hp_max: 20,
			attack: 15,
			defense: 10,
			spd: 2,
			role: "COMMON",
			sprites: {idle: spr_buck_l_idle, defend: spr_buck_l_idle},
			actions: [global.action_library.punch],
			xp_value: 20,
			AIscript: function(){
				var _action = actions[0];
				var _possible_targets = array_filter(obj_battle.party_units, function(_unit, _index){return(_unit.hp > 0);});
				var _target = _possible_targets[irandom(array_length(_possible_targets)-1)];
				return [_action, _target];
			}
		},
		#endregion
		#region BOSSES
		regulana:{
			name: "Regulana",
			hp: 80,
			hp_max: 80,
			attack: 10,
			defense: 5,
			spd: 2,
			role: "BOSS",
			sprites: {idle: spr_regulana_idle, defend: spr_regulana_idle},
			actions: [global.action_library.heartburn],
			xp_value:1,
			AIscript: function(){
				var _action = actions[0];
				var _possible_targets = array_filter(obj_battle.party_units, function(_unit, _index){return(_unit.hp > 0);});
				var _target = _possible_targets[irandom(array_length(_possible_targets)-1)];
				return [_action, _target];
			}
		},
		possessed_lyraka:{
			name: "Possesed Lyraka",
			hp: 1,
			hp_max: 80,
			attack: 6,
			defense: 3,
			spd: 2,
			role: "BOSS",
			sprites: {idle: spr_possessedlyraka},
			actions: [global.action_library.punch],
			xp_value:10,
			AIscript: function(){
				var _action = actions[0];
				var _possible_targets = array_filter(obj_battle.party_units, function(_unit, _index){return(_unit.hp > 0);});
				var _target = _possible_targets[irandom(array_length(_possible_targets)-1)];
				return [_action, _target];
			}
		},
		bullzo:{
			name: "Bullz O'",
			hp: 100,
			hp_max: 100,
			attack: 15,
			defense: 15,
			spd: 2,
			role: "BOSS",
			sprites: {idle: spr_bullz_o},
			actions: [global.action_library.punch, global.action_library.spin_attack],
			xp_value:100,
			AIscript: function(){
				var _action = choose(actions[0], action[1]);
				var _possible_targets = array_filter(obj_battle.party_units, function(_unit, _index){return(_unit.hp > 0);});
				var _target = _possible_targets[irandom(array_length(_possible_targets)-1)];
				return [_action, _target];
			}
		},
		ninja:{
			name: "Dark Assassin",
			hp: 80,
			hp_max: 80,
			attack: 15,
			defense: 15,
			spd: 2,
			role: "BOSS",
			sprites: {idle: spr_ninja_idle},
			actions: [global.action_library.punch],
			xp_value: 70,
			AIscript: function(){
				var _action = actions[0];
				var _possible_targets = array_filter(obj_battle.party_units, function(_unit, _index){return(_unit.hp > 0);});
				var _target = _possible_targets[irandom(array_length(_possible_targets)-1)];
				return [_action, _target];
			}
		}
		#endregion
	}
	#endregion
	global.inventory = [[global.action_library.tulip,5]];
	
}

function troop_dictionary(){
	global.troops = [
#region PROLOGUE CAVERNS
		[global.enemies.buck_o],
		[global.enemies.buck_o, global.enemies.buck_o],
		[global.enemies.buck_e, global.enemies.buck_o],
		[global.enemies.buck_l, global.enemies.buck_o],
#endregion
	]
}

#region leveling management
function recieve_exp(_xp){
	for(var _i = 0; _i < array_length(global.party); _i++){
		var _party = global.party[_i];
		if(_party.hp > 0) _party.experience += _xp;
		if (_party.experience >= _party.exp_max) {
			level_up(_party, _party.hp_max, _party.ep_max, _party.attack, _party.defense, _party.special, _party.spd);
		}
	}
}

function stats_update(){
	for(var _i = 0; _i < array_length(global.party); _i++){
		var _party = global.party[_i];
		if(_party.name != "Shelly"){
			_party.hp_max = round((_party.hp_max_BASE*2*_party.level)/100)+_party.level+28;
			_party.ep_max = round((_party.ep_max_BASE*2*_party.level)/100)+_party.level+6;
			_party.attack = round((_party.attack_BASE*2*_party.level)/100)+1;
			_party.defense = round((_party.defense_BASE*2*_party.level)/100)+1;
			_party.special = round((_party.special_BASE*2*_party.level)/100)+1;
			_party.spd = round((_party.spd_BASE*2*_party.level)/100)+2;
		}
		if(array_length(_party.perks) > 0){
			for(var _i = 0; _i < array_length(_party.perks); _i++){
				script_execute(_party.perks[_i].func, _party);
			}
		}
	}
}

function level_up(_member, _hpm, _epm, _atk, _def, _sp, _spd){
	while(_member.experience >= _member.exp_max){
		_member.level += 1;
		_member.experience -= (_member.exp_max);
		_member.exp_max += _member.level^3;
	}
	stats_update();
	
	var _name = _member.name
	var _hpm_diff = _member.hp_max - _hpm;
	var _epm_diff = _member.ep_max - _epm;
	var _atk_diff = _member.attack - _atk;
	var _def_diff = _member.defense - _def;
	var _sp_diff = _member.special - _sp;
	var _spd_diff = _member.spd - _spd;
	dialogue(DISPLAY.OVERHEAD,{text: _name+" is now level " + string(_member.level)+"!",name:""});
	if(_hpm_diff != 0) dialogue(DISPLAY.OVERHEAD,{text: _name+"'s max health increased by "+ string(_hpm_diff),name:""});
	if(_epm_diff != 0) dialogue(DISPLAY.OVERHEAD,{text: _name+"'s max energy increased by "+ string(_epm_diff),name:""});
	if(_atk_diff != 0) dialogue(DISPLAY.OVERHEAD,{text: _name+"'s attack increased by "+ string(_atk_diff),name:""});
	if(_def_diff != 0) dialogue(DISPLAY.OVERHEAD,{text: _name+"'s defense increased by "+ string(_def_diff),name:""});
	if(_sp_diff != 0) dialogue(DISPLAY.OVERHEAD,{text: _name+"'s special increased by "+ string(_sp_diff),name:""});
	if(_spd_diff != 0) dialogue(DISPLAY.OVERHEAD,{text: _name+"'s speed increased by "+ string(_spd_diff),name:""});
}
#endregion

#region Item Management
function remove_item_from_inventory(_item, _amount){
	for (var _i = 0; _i < array_length(global.inventory); _i++)
	{
		if (global.inventory[_i][0] == _item)
		{
			global.inventory[_i][1] -= _amount;
			if(instance_exists(obj_battle)){
				array_push(obj_battle.stashed_inventory, _item)
				//obj_battle.stashed_inventory;
			}
			if(global.inventory[_i][1] <= 0){
				array_delete(global.inventory,_i,1);
			}
			break;
		}
	}
}

function add_item_to_inventory(_item, _amount){
	var _item_found = false;
	for (var _i = 0; _i < array_length(global.inventory); _i++)
	{
		if (global.inventory[_i][0] == _item)
		{
			_item_found = true;
			global.inventory[_i][1] += _amount;
			break;
		}
	}
	if(_item_found != true){
		array_push(global.inventory,[_item, _amount]);
	}
}
#endregion