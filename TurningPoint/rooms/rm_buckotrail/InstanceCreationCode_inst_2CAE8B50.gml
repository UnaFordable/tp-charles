function scene_play(){
	dialogue(DISPLAY.NORMAL,{text:"HP and NRG fully restored to all!", name:""})
	for(var _i = 0; _i < array_length(global.party); _i++){
		var _party = global.party[_i];
		battle_change_hp(_party, _party.hp_max);
	}
	for(var _i = 0; _i < array_length(global.party); _i++){
		var _party = global.party[_i];
		battle_change_ep(_party, _party.ep_max);
	}
}