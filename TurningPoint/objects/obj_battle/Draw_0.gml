/// @description Insert description here
// You can write your code in this editor
draw_rectangle_color(global.cam_top_x, global.cam_top_y,global.cam_top_x+ global.cam_width,global.cam_top_y+ global.cam_height, c_white,c_white, c_maroon, c_maroon, false);

var _unit_with_current_turn = unit_turn_order[turn].id;
for(var _i = 0; _i < array_length(unit_render_order); _i++){
	with(unit_render_order[_i]){
		draw_self();
	}
}

draw_sprite(spr_battle_background_ui, 0, global.cam_bottom_x, global.cam_bottom_y);
//draw_sprite(Sprite85, 0,global.cam_top_x +global.cam_width, global.cam_top_y+global.cam_height - 32);

draw_sprite_stretched(spr_text_box, 0, global.cam_top_x, global.cam_top_y+16*9, 256, 16*3);
/*
draw_sprite_stretched(spr_text_box, 0, global.cam_bottom_x+16, global.cam_bottom_y+16, 32, 32);
draw_sprite_stretched(spr_text_box, 0, global.cam_bottom_x+16*5, global.cam_bottom_y+16, 32, 32);
draw_sprite_stretched(spr_text_box, 0, global.cam_bottom_x+16*9, global.cam_bottom_y+16, 32, 32);
draw_sprite_stretched(spr_text_box, 0, global.cam_bottom_x+16*13, global.cam_bottom_y+16, 32, 32);
*/
//#macro COLLUMN_ENEMY 15
#macro ROW_NAME 150
#macro ROW_HP 167
#macro ROW_EP 178

draw_set_font(fnt_ds);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_gray);

draw_set_color(c_white);
var _draw_limit = 3;
var _drawn = 0;
/*
for (var _i = 0; _i < array_length(enemy_units) and (_drawn < _draw_limit); _i++){
	draw_set_halign(fa_left);
	var _char = enemy_units[_i];
	if(_char.hp > 0){
		_drawn++;
		if(_char.id == _unit_with_current_turn){
			draw_set_color(c_yellow);
		}
		draw_text(global.cam_top_x+COLLUMN_ENEMY, global.cam_top_y+150 + (_i*16), _char.name);
	}
}*/


for (var _i = 0; _i < array_length(party_units); _i++) {
	   draw_set_halign(fa_left);
	var _char = party_units[_i];
	var _healthcol = c_green;
	if(_char.id == _unit_with_current_turn){
		draw_set_color(c_yellow);
	}
	if(_char.hp <= 0){
		draw_set_color(c_red);
	}
	draw_text(global.cam_top_x+10+ (_i*64), global.cam_top_y+ROW_NAME, _char.name);
	
	if(_char.hp > (_char.hp_max*.5)){
		_healthcol = c_green;
	}
	if(_char.hp < (_char.hp_max*.5)){
		_healthcol = c_orange;
	}
	if(_char.hp <= 0){
		_healthcol = c_red;
	}
	draw_text_color(global.cam_top_x+10+ (_i*64), global.cam_top_y+ROW_HP, string(_char.hp)+"/"+string(_char.hp_max),_healthcol,_healthcol,_healthcol,_healthcol,1);
	
	draw_set_color(c_white);
	if(_char.ep < (_char.ep_max*.5)){
		draw_set_color(c_orange);
	}
	if(_char.hp <= 0){
		draw_set_color(c_red);
	}
	if(_char.name != "Shelly") draw_text(global.cam_top_x+10 + (_i*64), global.cam_top_y+ROW_EP, string(_char.ep)+"/"+string(_char.ep_max));
	
	draw_set_color(c_white);
}
/*
if(cursor.active){
	with(cursor){
		if(active_target != noone){
			if(!is_array(active_target)){
				draw_sprite(spr_pointer, 0, active_target.x-16, active_target.y-16);
			}
			else{
				draw_set_alpha(sin(get_timer()/50000)+1)
				for(var _i = 0; _i < array_length(active_target); _i++){
					draw_sprite(spr_pointer, 0,active_target[_i].x-16, active_target[_i].y-16)
				}
				draw_set_alpha(1.0);
			}
		}
	}
}