/// @description Insert description here
// You can write your code in this editor
acting = false;
defending = false;
image_speed = random_range(1,1.5);

enemy = false;

//Shader variables

_uniColor = shader_get_uniform(Shader1, "u_color");
// the color is coded under RGBA (red, blue, green, alpha)
_color = [0.070, 0.278, 0.043, 0];