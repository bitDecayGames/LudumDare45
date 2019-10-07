/// @description sc_calcGrid(width,height, startPos);
/// @param width
/// @param height
/// @param startPos

var _width = argument0;
var _height = argument1;
var _startPos = argument2;


// create initial array
var outputArr = array_create(_width * _height, dir.vacant);
var curPos = _startPos
var curLineDir = dir.right

while(true) {
// draw left to right starting from top left in row 1 or 2
// track must go right from column 1 and down from last column, can go up/down between
	var nextDir
	if(curLineDir == dir.right) {
		if(curPos == _width - 1) {
			nextDir = dir.down;
			curLineDir = dir.down;
		}
		else if(curPos mod _width == 0) {
			nextDir = choose(dir.right)	
		} 
		else if(curPos > _width - 1) {
			nextDir = choose(dir.up, dir.right)
		} 
		else {
			nextDir = choose(dir.down, dir.right)
		}
	}
// start checking to make sure we're not going to collide with existing track
// track can go left or right or down, must go left if on last row
	else if(curLineDir == dir.down) {
		if(curPos > _width * _height - _width ) {
			nextDir = dir.left;
			curLineDir = dir.left;
		}
		else if(curPos mod _width == _width - 1) {
			if(outputArr[curPos - 1] != dir.vacant) {
				nextDir = choose(dir.down, dir.left);
			}
			else {
				nextDir = dir.down;	
			}
		}
		else {
			nextDir = choose(dir.down, dir.right);	
		}
	}
// track must go left or up or down, and up from first column
	else if(curLineDir == dir.left) {
		if(curPos mod _width == 0) {
			nextDir = dir.up;
			curLineDir = dir.up;
		}
		else if(curPos >= _width * _height - _width) {
			if(outputArr[curPos - _width] != dir.vacant) {
				nextDir = dir.left;	
			}
			else {
				nextDir = choose(dir.left, dir.up);	
			}
		}
		else {
			nextDir = choose(dir.left, dir.down);
		}	
	}
// track must go up or right or left, and attach to startPos
	else if(curLineDir == dir.up) {
		nextDir = dir.up
	}
	
	outputArr[curPos] = nextDir
	if(nextDir == dir.left) curPos = curPos - 1;
	else if(nextDir == dir.right) curPos = curPos + 1;
	else if(nextDir == dir.up) curPos = curPos - _width;
	else if(nextDir == dir.down) curPos = curPos + _width;
	
	if(curPos == _startPos) return outputArr
}
