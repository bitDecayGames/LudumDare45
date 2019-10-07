/// @description draw name text

if (hasInit && hasBuilt) {
	draw_sprite_ext(sp_portraits_sm, portraitIndex, x + portraitOffsetX, y + portraitOffsetY, portraitScale, portraitScale, 0, c_white, 1);
	
	shader_set(shd_colorMask);
	shader_set_uniform_f(u_red_tint, color[0], color[1], color[2]);
	shader_set_uniform_f(u_green_tint, color[3], color[4], color[5]);
	shader_set_uniform_f(u_blue_tint, color[6], color[7], color[8]);
	// draw car
	draw_sprite_ext(sp_truck, 1, x + carOffsetX + (room_width - targetX), y + carOffsetY, carScale, carScale, 0, c_white, 1);
	shader_reset();
	
	draw_set_font(fnt_arial)
	draw_set_halign(fa_left)
	draw_set_color(c_dkgray)
	draw_text(x + nameOffsetX, y + nameOffsetY, racerName);
	draw_set_halign(fa_right);
	draw_text(room_width - 50, y + nameOffsetY, "$" + string(winnings));
}