/// @description sc_getTrackDirs(grid, orderedGrid);
/// @param grid
/// @param orderedGrid

var _grid = argument0;
var _orderedGrid = argument1;

var numPieces = array_length_1d(_orderedGrid)
var outputArr = array_create(numPieces)

for(var i = 0; i < numPieces; i++) {
	var curDir = _grid[_orderedGrid[i]]
	if(i == 0) {
		outputArr[i] = trackDir.r2d;	
	}
	else {
		var prevDir = _grid[_orderedGrid[i - 1]]
		if(prevDir == dir.right) {
			if(curDir == dir.up) outputArr[i] = trackDir.l2u;
			else if(curDir == dir.down) outputArr[i] = trackDir.l2d;
			else if(curDir == dir.right) outputArr[i] = trackDir.l2r;
		}
		else if(prevDir == dir.down) {
			if(curDir == dir.left) outputArr[i] = trackDir.l2u;
			else if(curDir == dir.right) outputArr[i] = trackDir.u2r;
			else if(curDir == dir.down) outputArr[i] = trackDir.u2d;
		}
		else if(prevDir == dir.left) {
			if(curDir == dir.down) outputArr[i] = trackDir.r2d;
			else if(curDir == dir.left) outputArr[i] = trackDir.l2r;
			else if(curDir == dir.up) outputArr[i] = trackDir.u2r;
		}
		else if(prevDir == dir.up) {
			if(curDir == dir.left) outputArr[i] = trackDir.l2d;
			else if(curDir == dir.up) outputArr[i] = trackDir.u2d;
			else if(curDir == dir.right) outputArr[i] = trackDir.r2d;
		}
	}
}

return outputArr