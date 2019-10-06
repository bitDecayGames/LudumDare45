/// @description Insert description here
// You can write your code in this editor

shader_set(shd_colorMask);

var microsFive = sc_micros(5.0);

shader_set_uniform_f(u_red_tint, 0.0, get_timer() / sc_micros(5.0) mod 1.0, 0.0);
shader_set_uniform_f(u_green_tint, 0.0, get_timer() / sc_micros(10.0) mod 1.0, 0.0);
shader_set_uniform_f(u_blue_tint, get_timer() / sc_micros(20.0) mod 1.0, 0.0, 0.0);

draw_sprite(sprite_1, 0, x, y);


shader_reset();