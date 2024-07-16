/// @description Insert description here
// You can write your code in this editor
if(transition_prog < 1){
	draw_set_alpha(1-transition_prog)
	var _c = view_camera[0];
	if(surface_exists(surf_transition)){
		draw_surface_stretched(surf_transition, camera_get_view_x(_c), camera_get_view_y(_c), camera_get_view_width(_c), camera_get_view_height(_c));
	}
	draw_set_alpha(1);
}