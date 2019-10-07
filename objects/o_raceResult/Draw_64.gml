/// @description draw name text

if (hasInit && hasBuilt) {
	draw_sprite_ext(sp_portraits_sm, portraitIndex, x + portraitOffsetX, y + portraitOffsetY, portraitScale, portraitScale, 0, c_white, 1);
	
	draw_set_font(fnt_arial)
	draw_set_halign(fa_left)
	draw_set_color(c_ltgray)
	draw_text(x + nameOffsetX, y + nameOffsetY, racerName);
	draw_set_halign(fa_right);
	draw_text(room_width - 10, y + nameOffsetY, "$" + string(winnings));
}