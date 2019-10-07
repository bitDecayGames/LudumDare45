/// @description Insert description here
// You can write your code in this editor

width = width == 8 ? width : width + 1;
startPos =  choose(0, width)
grid = sc_calcGrid(width, height, startPos)
orderedTrack = sc_getOrderedTrack(width, height, startPos, grid)
trackDirs = sc_getTrackDirs(grid, orderedTrack)
orderedVacantSprites = sc_getOrderedVacancies(grid)