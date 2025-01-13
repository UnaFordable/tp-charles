/// @description Insert description here
// You can write your code in this editor
for(var _i = 0; _i > array_length(global.party); _i++){
	var _xp = irandom_range(7, 10);
	var _party = global.party[_i];
	_party.experience += _xp;
	if (_party.experience >= _party.exp_max){
		_party.level += 1;
		_party.experience = 0;
		_party.exp_max += 20;
	}
	
}
instance_destroy();