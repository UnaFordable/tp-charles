/// @description Insert description here
// You can write your code in this editor
for(var _i = 0; _i < array_length(global.party); _i++){
		var _party = global.party[_i];
		if(_party.name != "Shelly"){
			_party.level += 1;
		}
	}