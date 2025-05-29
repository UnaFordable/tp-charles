/// @description Insert description here
// You can write your code in this editor
with(obj_battle_menu) instance_destroy();
with(obj_bm_button){instance_destroy();}
for (var _i = 0; _i < array_length(global.party); _i++){
	global.party[_i].hp = party_units[_i].hp;
	global.party[_i].ep = party_units[_i].ep;
}
with (obj_battle_unit) instance_destroy();
with (obj_filmbackground) instance_destroy();



switch conclusion_type {
	case 0:
		instance_create_depth(x,y,depth-10, obj_game_over, {s_enemies: stashed_enemies, bg: battle_background, s_inventory: stashed_inventory, s_hp: stashed_hp, s_ep: stashed_ep});
		break;
	case 1:
		instance_activate_all();
		obj_player.key_action = false;
		// with the enemy NPC who started the battle to begin with
		with (creator){ 
			// disable the enemy NPC
			dead = true;
			// don't make the enemy NPC visible
			visible = false;
			// deactivate the enemy NPC
			instance_deactivate_object(id);
		}
		break;
	case 2:
		
		instance_activate_all();
		obj_player.key_action = false;
		with (creator){
			// set escape delay, allowing the 
			escape_delay = 300;
			// keep the enemy npc visible
			visible = true;
		}
		break;
}
