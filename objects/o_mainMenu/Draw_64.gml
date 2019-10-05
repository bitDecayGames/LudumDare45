/// @description draw text for each button

var i = 0
repeat(menuCount) {
	draw_set_font(fnt_arial)
	draw_set_halign(fa_center)
	draw_set_color(c_ltgray)
	if (i == selectedIndex) draw_set_color(c_red)
	draw_text(menuX, menuY + buttonHeight * i, button[i])
	i += 1
}
