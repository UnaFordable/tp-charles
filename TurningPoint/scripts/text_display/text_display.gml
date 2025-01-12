// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function text_display(_type, _x, _y, _string){
	switch _type { 
	case 0:
		draw_set_color(c_white);
		draw_text(_x, _y, _string);
		break;
	case 1:
		draw_set_color(c_dkgray);
		draw_text(_x+1, _y, _string);
		draw_text(_x, _y+1, _string);
		draw_text(_x+1, _y+1, _string);
		draw_set_color(c_white);
		draw_text(_x, _y, _string);
		break;
	case 2:
		draw_set_color(c_black);
		draw_text(_x+1, _y, _string);
		draw_text(_x-1, _y, _string);
		draw_text(_x, _y+1, _string);
		draw_text(_x, _y-1, _string);
		draw_set_color(c_white);
		draw_text(_x, _y, _string);
		break;
	
	}
}