/// @description Insert description here
// You can write your code in this editor
event_inherited();

title_text = string_hash_to_newline("Desaturation");
info_text = string_hash_to_newline("Desaturation:##-##1: desaturation strength#2: -#3: -");

// sprites:
sprite_1 = sp_characterSelectCar;

shader = shd_colorMask;
u_red_tint = shader_get_uniform(shader, "red_tint");
u_green_tint = shader_get_uniform(shader, "green_tint");
u_blue_tint = shader_get_uniform(shader, "blue_tint");
