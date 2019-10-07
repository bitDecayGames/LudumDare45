/// @description Insert description here
debug = false;
randomize();

width = 6;
height = 4;

chunk_size = 256;
offset = chunk_size / 2

var spritesToCenter = [sp_track_crv_1, sp_track_str_1, sp_background_01, sp_scene_01,
	sp_scene_02, sp_scene_03, sp_scene_04, sp_scene_05, sp_scene_06, sp_scene_07, sp_scene_08]
for (var i = 0; i < array_length_1d(spritesToCenter); i++) {
	sprite_set_offset(spritesToCenter[i], 128, 128);
}

dirString = ["vacant", "up", "right", "down", "left"]
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
global.trackPath = sc_getTrackAlignedPath(width, chunk_size, orderedTrack, trackDirs)
/********************************************************************/


// Collision Gen
//Level
var levelPath = global.trackPath;
var pathWidth = 128;
var pathColor = c_white;

//Vertex
vertex_format_begin();

vertex_format_add_position();
// vertex_format_add_color();

var vFormat = vertex_format_end();

vBuff = vertex_create_buffer();

vertex_begin(vBuff, vFormat);

var pathSize = path_get_number(levelPath);
var incr = (1/pathSize)/8;

levelFix1 = physics_fixture_create();
physics_fixture_set_chain_shape(levelFix1, 1);
levelFix2 = physics_fixture_create();
physics_fixture_set_chain_shape(levelFix2, 1);

for(var i=0; i<=1; i+=incr){
	var px = path_get_x(levelPath, i mod 1);
	var py = path_get_y(levelPath, i mod 1);
 
	var pnext = (i+incr) mod 1;
 
	var pxn = path_get_x(levelPath, pnext);
	var pyn = path_get_y(levelPath, pnext);
	var pdir = point_direction(px, py, pxn, pyn);
 
	var rotDeg = 90;
	var px1 = px + lengthdir_x(pathWidth/2, pdir - rotDeg);
	var py1 = py + lengthdir_y(pathWidth/2, pdir - rotDeg);
	var px2 = px + lengthdir_x(pathWidth/2, pdir + rotDeg);
	var py2 = py + lengthdir_y(pathWidth/2, pdir + rotDeg);
 
	vertex_position(vBuff, px1, py1);
	//vertex_colour(vBuff, pathColor, 1);
	vertex_position(vBuff, px2, py2);
	//vertex_colour(vBuff, pathColor, 1);
 
	//Fixture
	physics_fixture_add_point(levelFix1, px1, py1);
	physics_fixture_add_point(levelFix2, px2, py2);
}

physics_fixture_bind(levelFix1, id);
physics_fixture_delete(levelFix1);
physics_fixture_bind(levelFix2, id);
physics_fixture_delete(levelFix2);

vertex_end(vBuff);
vertex_freeze(vBuff);