/// @description slide in and keep child objects linked

if (hasInit){
	if (!hasBuilt) {
		if (place <= 2) {
			image_index = place;	
		} else {
			image_index = 3;		
		}

		portraitObjId = instance_create_depth(x + portraitOffsetX, y + portraitOffsetY, -100, o_characterSelectPortrait)

		// TODO: set the portrait.image_index to the correct player portrait
		portraitObjId.image_index = portraitIndex;
		
		hasBuilt = true;
	} else {
		portraitObjId.x = x + portraitOffsetX;
		portraitObjId.y = y + portraitOffsetY;
		
		if (x > targetX) x -= flyInSpeed;
	}
}
