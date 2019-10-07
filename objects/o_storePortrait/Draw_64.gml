/// @description draw name text and item icons

var curItemIndex = 0;

// /////////////
// do this for all items
var totalOilSlicks = global.player_oilslick[global.store_current_slot];
for (var i = 0; i < totalOilSlicks; ++i) {
	draw_sprite(sp_shopOilSlick_icon, 0, x + iconOffsetX + curItemIndex * iconSpacing, y + iconOffsetY);
	curItemIndex += 1;
}

var totalTurbos = global.player_turbo[global.store_current_slot];
for (var i = 0; i < totalTurbos; ++i) {
	draw_sprite(sp_shopOilSlick_icon, 0, x + iconOffsetX + curItemIndex * iconSpacing, y + iconOffsetY);
	curItemIndex += 1;
}
// /////////////

draw_set_font(fnt_arial);
draw_set_halign(fa_right);
draw_set_color(c_ltgray);
draw_text(x + textOffsetX, y + textOffsetY, name);
