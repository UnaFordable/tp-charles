/// @description Insert description here
// You can write your code in this editor

shader_set(Shader1);
shader_set_uniform_f_array(_uniColor, _color);

var _x = x + random_range(shake, -shake);
var _y = y + random_range(shake, -shake);

draw_sprite(sprite_index, image_index, _x, _y);
shader_reset();



