/// @description show player places

for (var i = 0; i < playerCount; ++i){
	
	var _y = curY[i];
	
	draw_set_font(fnt_arial_sm);
	draw_set_halign(fa_left);
	draw_set_color(c_dkgray);
	draw_text(textOffsetX, _y + textOffsetY, string(global.player_lap[i]) + "/3");
	
	var color = global.player_colors[i];
	
	shader_set(shd_colorMask);
	shader_set_uniform_f(u_red_tint, color[0], color[1], color[2]);
	shader_set_uniform_f(u_green_tint, color[3], color[4], color[5]);
	shader_set_uniform_f(u_blue_tint, color[6], color[7], color[8]);
	// draw car
	draw_sprite_ext(sp_truck, 1, carOffsetX, _y + carOffsetY, carScale, carScale, 0, c_white, 1);
	shader_reset();
	
	draw_sprite_ext(sp_portraits, global.player_portrait[i] * 3 + 2, placePortraitOffsetX, _y + placePortraitOfffsetY, placePortraitScale, placePortraitScale, 0, c_white, 1);
	
	var iconCount = 0;
	for (var k = 0; k < global.player_armor[i]; ++k) {
		draw_sprite_ext(sp_armor, 1, iconOffsetX + iconCount * iconSpace, _y + iconOffsetY, iconScale, iconScale, 0, c_white, 1);
		iconCount += 1;
	}
	for (var k = 0; k < global.player_oilslick[i]; ++k) {
		draw_sprite_ext(sp_shopOilSlick, 1, iconOffsetX + iconCount * iconSpace, _y + iconOffsetY, iconScale, iconScale, 0, c_white, 1);
		iconCount += 1;
	}
}