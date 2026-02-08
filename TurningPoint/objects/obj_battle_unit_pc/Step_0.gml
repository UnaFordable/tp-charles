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

//SHOW CHARACTER ANIMATING UP AND DOWN WHEN IT'S THERE TURN
if(instance_exists(obj_battle) && turn_ready == true){
	if(bobbing_speed = 0){ bobbing_speed = 10 } else bobbing_speed --;
	if(bob_up == true && bobbing_speed == 0){ y--;} 
	else if(bob_up == false && bobbing_speed == 0){ y++;}
	if(y = anim_bot){ bob_up = true} else if(y = anim_top){ bob_up = false;}
}
