/// @description Insert description here
// You can write your code in this editor

width = 6;
height = 4;

chunk_size = 256;

dirString = ["vacant", "up", "right", "down", "left"]
var spritesToCenter = [sp_track_crv_1, sp_track_str_1, sp_background]
for (var i = 0; i < array_length_1d(spritesToCenter); i++) {
	sprite_set_offset(spritesToCenter[i], 128, 128);
}

enum dir {
   vacant = 0,
   up = 1, // curPos - _width
   right = 2, // curPos + 1 // curPos mod _width < _width - 1
   down = 3, // curPos + _width
   left = 4, // curPos + 1  
}

enum trackDir {
	l2u,
	l2r,
	l2d,
	u2r,
	u2d,
	r2d,
}

startPos =  choose(0, width)
grid = sc_calcGrid(width, height, startPos)
orderedTrack = sc_getOrderedTrack(width, height, startPos, grid)
trackDirs = sc_getTrackDirs(grid, orderedTrack)
// window_set_size(chunk_size * width, chunk_size * height);


