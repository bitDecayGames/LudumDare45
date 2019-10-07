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
	
	if debug {
		var str = string(i) + " " + string(dirString[grid[gridPos]]) + string(rot) + " " + string(gridPos) + " " + string(startX) + ", " + string(startY)
		draw_text(startX, startY, str);	
	}

	draw_sprite_ext(trackPiece, 0, startX + offset + global.track_x_offset, startY + offset, 1, 1, rot, c_white, 1);
}


for(var i = 0; i < array_length_1d(grid); i++) {
	var spr = orderedVacantSprites[i]
	if(spr == 0) continue
	
	var startX = (i mod width) * chunk_size
	var startY = floor(i / width) * chunk_size
	if debug {
		draw_text(startX, startY, "Sprite " + string(i));	
	}
	// var vacantSprite = vacantSprites[i]; //ds_list_read(vacantSpriteList, vacantIdx++)
	//show_debug_message(string(vacantSprite))
	
	draw_sprite_ext(spr, 0, startX + offset, startY + offset, 1, 1, 0, c_white, 1);
}

if debug {
	vertex_submit(vBuff, pr_linestrip, -1);
	
	var path = global.trackPath;
	var numPoints = path_get_number(path);
	for (var i = 0; i < numPoints; i++) {
		var pathPointX = path_get_point_x(path, i);
		var pathPointY = path_get_point_y(path, i);
		draw_circle_colour(pathPointX, pathPointY, 96, 0, c_red, true);
	}
}

// Track edge
var trackEdgeWidth = 3;

var numPoints = path_get_number(trackEdge1);
for (var i = 0; i < numPoints; i++) {
	var nextI = i + 1;
	if nextI > numPoints - 1 {
		nextI = 0;	
	}
	
	var edgePointX = path_get_point_x(trackEdge1, i);
	var edgePointY = path_get_point_y(trackEdge1, i);
	var nextX = path_get_point_x(trackEdge1, nextI);
	var nextY = path_get_point_y(trackEdge1, nextI);
	draw_set_color(c_olive);
	draw_line_width(edgePointX, edgePointY, nextX, nextY, trackEdgeWidth);
}

var numPoints = path_get_number(trackEdge2);
for (var i = 0; i < numPoints; i++) {
	var nextI = i + 1;
	if nextI > numPoints - 1 {
		nextI = 0;	
	}
	
	var edgePointX = path_get_point_x(trackEdge2, i);
	var edgePointY = path_get_point_y(trackEdge2, i);
	var nextX = path_get_point_x(trackEdge2, nextI);
	var nextY = path_get_point_y(trackEdge2, nextI);
	draw_set_color(c_olive);
	draw_line_width(edgePointX, edgePointY, nextX, nextY, trackEdgeWidth);
}