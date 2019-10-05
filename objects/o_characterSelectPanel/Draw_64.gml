/// @description draw player name
//draw_self()
if (hasActivePlayer) {
	
	draw_set_font(fnt_arial_sm)
	draw_set_halign(fa_center)
	draw_set_color(c_white)
	draw_text(x + nameOffsetX, y + nameOffsetY, playerName);	
}
