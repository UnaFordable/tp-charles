/// @description Insert description here
// You can write your code in this editor
event_inherited();
depth = -y;
if(keyboard_check_pressed(ord("Z"))){
if(collision_circle(x,y, 10, obj_player, true, false) != noone){
	if(interacted == false){
		interacted = true;
		dialogue(DISPLAY.NORMAL, [{text:"I hope this works\n This took several hours", name:"Name here"}, ])
		//new_encounter([global.enemies.lyraka], spr_battle_background_ui);
	}
}
else{
	
}
}