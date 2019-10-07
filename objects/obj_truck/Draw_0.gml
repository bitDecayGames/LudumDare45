draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);

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
}
