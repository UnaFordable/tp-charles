/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_ds);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

draw_rectangle(global.cam_bottom_x, global.cam_bottom_y, global.cam_width+global.cam_bottom_x, global.cam_height+global.cam_bottom_y, false);

draw_text_color(global.cam_bottom_x+(global.cam_width*.1),global.cam_bottom_y+(global.cam_height*0.1),"",col,col,col,col,1);
//draw_sprite(spr_player, 0, 32,160);