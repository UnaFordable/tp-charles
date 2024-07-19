/// @description Insert description here
// You can write your code in this editor
switch(m_state){
	case MENU.STATS:
		background_img = 0;
		break;
	case MENU.ITEMS:
		background_img = 1;
		break;
	case MENU.PERKS:
		background_img = 2;
		break;
	case MENU.OPTIONS:
		background_img = 3;
		break;
}
draw_sprite(spr_bsm_background, background_img, global.cam_bottom_x, global.cam_bottom_y);