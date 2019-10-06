/// @description Insert description here

for(var i = 0; i < ww * wh; i++) {
	// var ran_data = irandom_range(1, 50);
	// tilemap_set_at_pixel(global.ground_tilemap_lava, ran_data, (i mod ww) * 16.0, floor(i / ww) * 16.0);
	var startX = (i mod ww) * (chunk_size * 2)
	var startY = floor(i / ww) * (chunk_size * 2)
	var col = merge_colour(c_blue, c_green, perlinNoise[i]);
	draw_set_colour(col)
	draw_rectangle(startX, startY, startX + chunk_size, startY + chunk_size, false);
	// draw_text(startX, startY, string(perlinNoise[i]));
}