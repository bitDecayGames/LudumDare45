/// @description draw player name
if (hasActivePlayer) {	
	// draw portrait
	draw_sprite_ext(sp_portraits, global.player_portrait[slot] * 3 + 2, x + portraitOffsetX, y + portraitOffsetY, portraitScaleX, portraitScaleY, 0, c_white, 1);
	
	shader_set(shd_colorMask);
	shader_set_uniform_f(u_red_tint, color[0], color[1], color[2]);
	shader_set_uniform_f(u_green_tint, color[3], color[4], color[5]);
	shader_set_uniform_f(u_blue_tint, color[6], color[7], color[8]);
	// draw car
	draw_sprite_ext(sp_truck, 1, x + carOffsetX, y + carOffsetY, carScale, carScale, 0, c_white, 1);
	shader_reset();
	
	// draw name text
	draw_set_font(fnt_arial_sm)
	draw_set_halign(fa_center)
	draw_set_color(c_white)
	draw_text(x + nameOffsetX, y + nameOffsetY, playerName);
}

