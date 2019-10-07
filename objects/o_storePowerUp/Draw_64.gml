/// @description draw cost and name

var cost = "--";
if (available) {
	image_index = 1;
	cost = "$" + string(baseCost);
}
else {
	image_index = 0;
}

draw_sprite(sp_shopFrame, 0, x, y);

draw_set_font(fnt_arial);
draw_set_halign(fa_center);
draw_set_color(c_ltgray);

draw_text(x + textOffsetX, y + textOffsetY, label);

var changeY = 0;
if (isSelected) { 
	changeY = -10;
	draw_set_color(c_red);
}

draw_text(x + costOffsetX, y + costOffsetY + changeY, cost);
