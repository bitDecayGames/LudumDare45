/// @description draw name text and item icons

var curItemIndex = 0;

// /////////////
// do this for all items
var totalOilSlicks = global.player_oilslick[global.store_current_slot];
for (var i = 0; i < totalOilSlicks; ++i) {
	draw_sprite_ext(sp_shopOilSlick, 1, x + iconOffsetX + curItemIndex * iconSpacing, y + iconOffsetY, iconScale, iconScale, 0, c_white, 1);
	curItemIndex += 1;
}

var totalArmor = global.player_armor[global.store_current_slot];
for (var i = 0; i < totalArmor; ++i) {
	draw_sprite_ext(sp_armor, 1, x + iconOffsetX + curItemIndex * iconSpacing, y + iconOffsetY, iconScale, iconScale, 0, c_white, 1);
	curItemIndex += 1;
}
// /////////////

draw_set_font(fnt_arial);
draw_set_halign(fa_right);
draw_set_color(c_dkgray);
draw_text(x + textOffsetX, y + textOffsetY, name);
