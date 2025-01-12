// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function char_stats(){
	enum MODE{
		NEVER = 0,
		ALWAYS = 1,
		VARIES = 2,
	}
	enum ROLE{
		SUPPORT,
		COMMON,
		BOSS
	}
	
	global.action_library = {
		#region PHYSICAL ATTACKS
		punch: {
			name: "Attack",
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
				var _damage = ceil(2*(_user.attack)-1.5*(_targets[0].defense) + irandom_range(0,1));
				battle_change_hp(_targets[0], -_damage+choose(0,1), 0);
			}
		},
		roll: {},
		#endregion
		
		#region SKILLS
		block:{
			name: "Block",
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
			description: "Ran away",
			sub_menu: "Skills",
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
			name: "Spin Slam",
			description: "{0} makes a deadly spin!",
			sub_menu: "Skills",
			ep_cost: 1,
			target_required: true,
			target_enemy_by_default: true,
			target_all: MODE.ALWAYS,
			user_animation: "attack",
			effect_sprite: spr_scratch,
			effect_on_target: MODE.ALWAYS,
			func: function(_user, _targets){
				var _damage = ceil(4*(_user.attack)-(2*_targets[0].defense) + irandom_range(0,1));
				battle_change_hp(_targets[0], -_damage, 0);
				_user.ep -= ep_cost;
			}
		},
		fart_attack:{
			name: "Fart Atk",
			description: "{0} farts towards the enemy",
			sub_menu: "Skills",
			ep_cost: 1,
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
			description: "{0} gives rubs!",
			sub_menu: "Skills",
			ep_cost: 1,
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
			description: "{0} ate a tulip!",
			sub_menu: "Items",
			target_required: true,
			target_enemy_by_default: false,
			target_all: MODE.NEVER,
			func : function(_user, _targets){
				var _heal = 10;
				battle_change_hp(_targets[0], _heal);
			}
		},
		milk:{
			name: "Milk",
			description: "{0} drank milk!",
			sub_menu: "Items",
			target_required: true,
			target_enemy_by_default: false,
			target_all: MODE.NEVER,
			func : function(_user, _targets){
				var _heal_ep = 10;
				battle_change_hp(_targets[0], _heal_ep, true);
			}
		},
		
		potion:{
			name : "Potion",
			description : "{0} uses a Potion!",
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
	#region MAIN PARTY
	global.party = [
	{
		
		name: "Lyraka",
		hp: 20,
		hp_max: 20,
		ep: 2,
		ep_max: 2,
		attack: 2,
		defense: 2,
		special: 10,
		spd: 2,
		level: 1,
		experience : 0,
		exp_max: 20,
		sprites :{walk: spr_lusaka_walk, idle: spr_Lyraka_bat_bak, knockout: spr_rip},
		actions: [global.action_library.punch, global.action_library.spin_attack, global.action_library.fart_attack, global.action_library.run]
	},{
		name: "Baxter",
		hp: 29,
		hp_max: 29,
		ep: 6,
		ep_max: 6,
		attack: 5,
		defense: 4,
		special: 5,
		spd: 3,
		level: 12,
		experience: 0,
		exp_max: 20,
		sprites: {walk: spr_baxter_walk, idle: spr_bax_bat_bak, knockout: spr_rip},
		actions: [global.action_library.punch, global.action_library.rub, global.action_library.run]
	},{
		name: "Donohue",
		hp: 34,
		hp_max: 34,
		ep: 6,
		ep_max: 6,
		attack: 8,
		defense: 2,
		special: 5,
		spd: 2,
		level: 27,
		experience: 0,
		exp_max: 20,
		sprites :{walk: spr_baxter_walk, idle: spr_Dono_bat_back, attack: spr_donohue_idle, dodge: spr_donohue_idle, knockout: spr_rip, defend: spr_donohue_idle},
		actions: [global.action_library.punch, global.action_library.manshot]
	},{
		name: "Shelly",
		hp: 300,
		hp_max: 300,
		ep: 0,
		ep_max: 0,
		attack: 8,
		defense: 2,
		special: 20,
		spd: 2,
		level: 1,
		experience: 0,
		exp_max: 20,
		sprites :{walk: spr_baxter_walk, idle: spr_shel_bat_bak, attack: spr_shelly_idle, dodge: spr_shelly_idle, knockout: spr_rip, defend: spr_shelly_idle},
		actions: [global.action_library.punch, global.action_library.slime_spit, global.action_library.run]
	}]
#endregion
	#region ALL EMEMIES
	global.enemies = {
		#region Basic enemies
		buck_o:{
			name: "Buck O'",
			hp: 12,
			hp_max: 12,
			attack: 4,
			defense: 1,
			spd: 2,
			role: "COMMON",
			sprites: {idle: spr_buck_o_idle, defend: spr_buck_o_idle},
			actions: [global.action_library.punch],
			xp_value:1,
			AIscript: function(){
				var _action = actions[0];
				var _possible_targets = array_filter(obj_battle.party_units, function(_unit, _index){return(_unit.hp > 0);});
				var _target = _possible_targets[irandom(array_length(_possible_targets)-1)];
				return [_action, _target];
			}
		},
		buck_o:{
			name: "Buck E'",
			hp: 12,
			hp_max: 12,
			attack: 1,
			defense: 1,
			spd: 2,
			role: "COMMON",
			sprites: {idle: spr_buck_e_idle, defend: spr_buck_e_idle},
			actions: [global.action_library.punch],
			xp_value:1,
			AIscript: function(){
				var _action = actions[0];
				var _possible_targets = array_filter(obj_battle.party_units, function(_unit, _index){return(_unit.hp > 0);});
				var _target = _possible_targets[irandom(array_length(_possible_targets)-1)];
				return [_action, _target];
			}
		},
		buck_o:{
			name: "Buck L'",
			hp: 12,
			hp_max: 12,
			attack: 3,
			defense: 1,
			spd: 2,
			role: "COMMON",
			sprites: {idle: spr_buck_r_idle, defend: spr_buck_r_idle},
			actions: [global.action_library.punch],
			xp_value:1,
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
			hp: 80,
			hp_max: 80,
			attack: 6,
			defense: 3,
			spd: 2,
			role: "BOSS",
			sprites: {idle: spr_possessedlyraka},
			actions: [global.action_library.punch],
			xp_value:1,
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
	global.inventory = [
	[global.action_library.tulip, 4],
	[global.action_library.milk, 1],
	[global.action_library.potion, 2]
]
}



function remove_item_from_inventory(_item, _amount){
	for (var _i = 0; _i < array_length(global.inventory); _i++)
	{
		if (global.inventory[_i][0] == _item)
		{
			global.inventory[_i][1] -= _amount;
			break;
		}
	}
}
