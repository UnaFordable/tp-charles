/// @description Insert description here
// You can write your code in this editor
event_inherited();

function scene_play(){
	cutscene_begin(
	[[dialogue, DISPLAY.NORMAL, {text: "Spend 10 ",name:""}]]
	);
	cutscene_begin(
	[[dialogue, DISPLAY.NORMAL, {text: "You slept at the inn and feel rejuvinated!",name:""}]]
	);
	for(var _i = 0; _i < array_length(global.party); _i++){
		var _party = global.party[_i];
		battle_change_hp(_party, _party.hp_max);
	}
	for(var _i = 0; _i < array_length(global.party); _i++){
		var _party = global.party[_i];
		battle_change_ep(_party, _party.ep_max);
	}
}