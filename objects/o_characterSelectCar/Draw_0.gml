/// @description Insert description here
// You can write your code in this editor

shader_set(shd_colorMask);

shader_set_uniform_f(u_red_tint, 0.0, 0.0, 1.0);
shader_set_uniform_f(u_green_tint, 1.0, 0.0, 1.0);
shader_set_uniform_f(u_blue_tint, 0.7, 0.7, 1.0);

draw_sprite(sprite_1, 0, x, y);


shader_reset();