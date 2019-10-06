/// @description create race result list

raceResultHeight = 90;
initialDistance = 1200;
distanceOffset = 200;

var numberOfRacers = array_length_1d(global.player_name);
for (var i = 0; i < numberOfRacers; ++i) {
	var slot = -1;
	for (var k = 0; k < numberOfRacers; ++k){
		if (global.player_place[k] == i) {
			slot = k;
			break;	
		}
	}
	
	if (slot >= 0) {
	    raceResultObjs[i] = instance_create_depth(x + initialDistance + distanceOffset * i, y + raceResultHeight * i, -100, o_raceResult)
	
		raceResultObjs[i].slot = slot;
	
		// ignore this stuff
		raceResultObjs[i].hasInit = true;
		raceResultObjs[i].targetX = x;
	}
}
