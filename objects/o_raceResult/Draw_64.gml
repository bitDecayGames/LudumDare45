/// @description draw name text

if (hasInit && hasBuilt) {
	draw_set_font(fnt_arial)
	draw_set_halign(fa_left)
	draw_set_color(c_ltgray)
	draw_text(x + nameOffsetX, y + nameOffsetY, racerName);
}