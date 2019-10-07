/// @description sc_getOrderedTrack(width, height, startPos, grid);
/// @param width
/// @param height
/// @param startPos
/// @param grid

var _width = argument0;
var _height = argument1;
var _startPos = argument2;
var _grid = argument3;

var curPos = _startPos;
var outputArr = [];
var curNum = 0;

while(true) {
	outputArr[curNum] = curPos;
	curNum++
	if(_grid[curPos] == dir.right) curPos += 1
	else if(_grid[curPos] == dir.left) curPos -= 1;
	else if(_grid[curPos] == dir.up) curPos -= _width;
	else if(_grid[curPos] == dir.down) curPos += _width;
	
	if(curPos == _startPos) {
		show_debug_message("Found " + string(curNum) + " tiles")
		return outputArr
	}
}
