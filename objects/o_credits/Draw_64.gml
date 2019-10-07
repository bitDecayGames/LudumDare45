/// @description draw credits

for (var i = 0; i < creditLen; ++i) {
	var c = credits[i];
	draw_set_font(fnt_arial);
	draw_set_halign(fa_center);
	draw_set_color(c_dkgray);
	draw_text(creditOffsetX, creditOffsetY + i * creditSpace, c);
}
