/// @description Insert description here
// You can write your code in this editor
randomize();

width = 6;
height = 4;

chunk_size = 256;
offset = chunk_size / 2

dirString = ["vacant", "up", "right", "down", "left"]
var spritesToCenter = [sp_track_crv_1, sp_track_str_1, sp_background_01, sp_scene_01,
	sp_scene_02, sp_scene_03, sp_scene_04, sp_scene_05, sp_scene_06, sp_scene_07, sp_scene_08]
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

/****************************** FULL TRACK GEN **********************/
startPos =  choose(0, width)
grid = sc_calcGrid(width, height, startPos)
orderedTrack = sc_getOrderedTrack(width, height, startPos, grid)
trackDirs = sc_getTrackDirs(grid, orderedTrack)
orderedVacantSprites = sc_getOrderedVacancies(grid)
/********************************************************************/
