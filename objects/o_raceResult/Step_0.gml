/// @description slide in and keep child objects linked

var place = global.player_place[slot];

if (hasInit){
	if (!hasBuilt) {
		if (place <= 2) {
			image_index = place;	
		} else {
			image_index = 3;		
		}

		portraitObjId = instance_create_depth(x + portraitOffsetX, y + portraitOffsetY, -100, o_characterSelectPortrait)

		// set the portrait.image_index to the correct player portrait
		portraitObjId.image_index = global.player_portrait[slot];
		
		hasBuilt = true;
		
		racerName = global.player_name[slot];
	} else {
		portraitObjId.x = x + portraitOffsetX;
		portraitObjId.y = y + portraitOffsetY;
		
		if (x > targetX) x -= flyInSpeed;
	}
}
