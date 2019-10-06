draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);

if (debug) {
	draw_set_color(c_ltgray);
//	draw_text(debugTargetPointX, debugTargetPointY, "X");
	draw_text(x - 50, y + 50, debugStr);

	draw_set_color(c_red);
	draw_line_width(x, y, x + debugAccelX * 20, y + debugAccelY * 20, 3);

	draw_set_color(c_blue);
	draw_line_width(x, y, x + debugFaceX * 30, y + debugFaceY * 30, 3);
}
