
shader_set(shd_colorMask);

shader_set_uniform_f(u_red_tint, color[0], color[1], color[2]);
shader_set_uniform_f(u_green_tint, color[3], color[4], color[5]);
shader_set_uniform_f(u_blue_tint, color[6], color[7], color[8]);

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);

shader_reset();

// Show health bar when hit.
if (alarm[0] > 0) {
	var barHeight = 5;
	var barOffset = 15;
	var barY = y - barOffset;
	draw_set_color(c_red);
	draw_line_width(x - barOffset, barY, x + barOffset, barY, barHeight);
	
	draw_set_color(c_green);
	var hpPecent = hitpoints / maxHitpoints;
	draw_line_width(x + barOffset - (barOffset * hpPecent * 2), barY, x + barOffset, barY, barHeight);
}

if (debug) {
	draw_set_color(c_ltgray);
	draw_text(x - 50, y + 50, debugStr);
	draw_text(debugTargetPointX, debugTargetPointY, "X");

	// Velocity
	draw_set_color(c_white)
	draw_line_width(x, y, x + phy_linear_velocity_x, y + phy_linear_velocity_y, 3);

    // Force
	draw_set_color(c_red);
	draw_line_width(x, y, x + debugForceX * 30, y + debugForceY * 30, 3);

	// Facing
	draw_set_color(c_blue);
	draw_line_width(x, y, x + debugFaceX * 30, y + debugFaceY * 30, 3);
	
	// Hit
	draw_set_color(c_yellow);
	draw_arrow(x, y, x + debugHitX * 30, y + debugHitY * 30, 10);
}
