/// @description Insert description here
// You can write your code in this editor

for(var i = 0; i < array_length_1d(orderedTrack); i++) {
	var gridPos = orderedTrack[i];
	var dir = trackDirs[i]
	var startX = (gridPos mod width) * chunk_size
	var startY = floor(gridPos / width) * chunk_size
	// var col = merge_colour(c_blue, c_green, grid[i] / 10);
	// draw_set_colour(col)
	// draw_rectangle(startX, startY, startX + chunk_size, startY + chunk_size, false);
	var trackPiece = sp_track_crv_1;
	if(dir == trackDir.l2r || dir == trackDir.u2d) {
		trackPiece = sp_track_str_1
	}
	
	var rot = 0;
	if(dir == trackDir.u2d || dir == trackDir.l2d) {
		rot = 90;
	}
	else if(dir == trackDir.r2d) {
		rot = 180;
	}
	else if(dir == trackDir.u2r) {
		rot = 270;	
	}
	var str = string(i) + " " + string(dirString[grid[gridPos]]) + string(rot) + " " + string(gridPos) + " " + string(startX) + ", " + string(startY)
	draw_text(startX, startY, str);
	show_debug_message("drawing " + string(i))

	draw_sprite_ext(trackPiece, 0, startX + (chunk_size / 2), startY + (chunk_size / 2), 1, 1, rot, c_white, 1);
}
	show_debug_message("drawing complete")