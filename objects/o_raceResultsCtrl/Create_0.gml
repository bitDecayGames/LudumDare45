/// @description create race result list

raceResultHeight = 90;
initialDistance = 1200;
distanceOffset = 200;

for (var i = 0; i < numberOfRacers; ++i) {
    raceResultObjs[i] = instance_create_depth(x + initialDistance + distanceOffset * i, y + raceResultHeight * i, -100, o_raceResult)
	
	// these need to be set based on the place of each player, so like maybe a global array with this player data?
	raceResultObjs[i].place = i	
	raceResultObjs[i].racerName = "Hello world " + string(i);
	
	// ignore this stuff
	raceResultObjs[i].hasInit = true;
	raceResultObjs[i].targetX = x;
}
