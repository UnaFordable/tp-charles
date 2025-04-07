/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_battle_menu) and obj_battle_menu.active = true){ 
	switch(button_name){
		case "Attack":
			button_name = "FIGHT";
			icon = 0;
			break;
		case "Skills":
			button_name = "SKILL";
			icon = 1;
			break;
		case "Items":
			button_name = "STUFF";
			icon = 2;
			break;
		case "Flee":
			button_name = "IDEAS";
			icon = 3;
			break;
	}
	draw_self();
	text_display(2, x+16,y+2,button_name);
	draw_sprite(spr_move_icons, icon, x+2, y+2);
}
