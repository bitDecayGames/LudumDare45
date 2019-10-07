/// @description calculate place

sc_calculate_place();

for (var i = 0; i < playerCount; ++i){
	
	var place = global.player_place[i];
	var tar = place * placeSpace;
	targetY[i] = tar;
	var cur = curY[i];
	if (cur > tar) {
		cur -= changeSpeed;
	} else if (cur < tar) {
		cur += changeSpeed;	
	}
	curY[i] = cur;
}