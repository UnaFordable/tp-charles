/// @description Insert description here
// You can write your code in this editor
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

pokecenter = import_obj("GarbageCan.obj", vertex_format);

vertex_buffer = vertex_create_buffer();
vertex_begin(vertex_buffer, vertex_format)

var _spacing = 32;

var _x1 = 50;
var _x2 = 100;
var _y1 = 50;
var _y2 = 100;

vertex_add_point(vertex_buffer, _x1,_y1, 1, 0,0,1,0,0,c_white, 1);
vertex_add_point(vertex_buffer, _x2,_y1, 1, 0,0,1,0,0,c_white, 1);
vertex_add_point(vertex_buffer, _x2,_y2, 1, 0,0,1,0,0,c_white, 1);
vertex_add_point(vertex_buffer, _x2,_y2, 1, 0,0,1,0,0,c_white, 1);
vertex_add_point(vertex_buffer, _x1,_y2, 1, 0,0,1,0,0,c_white, 1);
vertex_add_point(vertex_buffer, _x1,_y1, 1, 0,0,1,0,0,c_white, 1);

vertex_end(vertex_buffer);