/// @description sc_getTrackAlignedPath(width, chunk_size, orderedTrack;
/// @param width
/// @param chunk_size
/// @param orderedTrack


var _width = argument0;
var _chunk_size = argument1;
var _orderedTrack = argument2;

var gridLen = array_length_1d(_orderedTrack)
var offset = _chunk_size / 2

var newPath = path_add()
path_set_kind(newPath, 1)
path_set_closed(newPath, true);


for (var i = 0; i < gridLen; i++) {
	var gridPos = _orderedTrack[i]
	var startX = (gridPos mod _width) * _chunk_size
	var startY = floor(gridPos / _width) * _chunk_size
	path_add_point(newPath, startX + offset, startY + offset, 100);
}

return newPath