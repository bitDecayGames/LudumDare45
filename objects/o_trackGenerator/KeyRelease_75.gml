/// @description Insert description here
// You can write your code in this editor

height = height == 2 ? height : height - 1;
startPos =  choose(0, width)
grid = sc_calcGrid(width, height, startPos)
orderedTrack = sc_getOrderedTrack(width, height, startPos, grid)
trackDirs = sc_getTrackDirs(grid, orderedTrack)