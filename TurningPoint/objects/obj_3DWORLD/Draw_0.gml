/// @description Insert description here
// You can write your code in this editor
var _camera = camera_get_active();
camera_set_view_mat(_camera, matrix_build_lookat(0,0,32, room_width/2, room_height/2, 0,0,0, 1));
camera_set_proj_mat(_camera, matrix_build_projection_perspective_fov(-60, -window_get_width()/window_get_height(), 1, 32000));
camera_apply(_camera)

vertex_submit(vertex_buffer, pr_trianglelist, sprite_get_texture(spr_battle_background_ui, 0));
//matrix_set(matrix_world, matrix_build(0,0,0,0,0,0, 1.5,1.5,1.5));
vertex_submit(pokecenter, pr_trianglelist, sprite_get_texture(spr_battle_background_ui, 0));