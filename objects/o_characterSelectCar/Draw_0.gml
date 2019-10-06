/// @description Insert description here
// You can write your code in this editor

shader_set(shd_colorMask);

shader_set_uniform_f(u_red_tint, color1_r, color1_g, color1_b);
shader_set_uniform_f(u_green_tint, color2_r, color2_g, color2_b);
shader_set_uniform_f(u_blue_tint, color3_r, color3_g, color3_b);

draw_sprite(sprite_1, 0, x, y);


shader_reset();