/// @description Insert description here
// You can write your code in this editor
event_inherited();
if(obj_battle.escaped and hp > 0){
	x-=2;
}
if(hp <=0){
	sprite_index = sprites.knockout;
}
else{
	if(sprite_index == sprites.knockout){
		sprite_index = sprites.idle;
	}
}




