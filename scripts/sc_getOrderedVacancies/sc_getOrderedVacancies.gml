/// @description sc_getOrderedVacancies(grid);
/// @param grid

var _grid = argument0;

var gridLen = array_length_1d(_grid)
var outputArr = array_create(gridLen)

for (var i = 0; i < gridLen; i++) {
	var rand = random(1)
	if(_grid[i] == dir.vacant) {
		if(rand > .2) {
			outputArr[i] = choose(sp_scene_01, sp_scene_02, sp_scene_08)	
		}
		else {
			outputArr[i] = choose(sp_scene_03, sp_scene_04, sp_scene_05, sp_scene_06, sp_scene_07);
		}
	}
}

return outputArr