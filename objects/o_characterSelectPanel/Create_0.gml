/// @description create child portrait

// CONSTANTS
nameOffsetX = 210;
nameOffsetY = 70;

portraitOffsetX = 150;
portraitOffsetY = -100;

carOffsetX = 110;
carOffsetY = 20;
// ////////////////////////


portraitObjId = instance_create_depth(x + portraitOffsetX, y + portraitOffsetY, -100, o_characterSelectPortrait)
carObjId = instance_create_depth(x + carOffsetX, y + carOffsetY, -100, o_characterSelectCar)

if (slot == 0) {
	image_index = 0;
} else {
	image_index = 1;	
}

hasActivePlayer = false
portraitObjId.visible = hasActivePlayer;
carObjId.visible = hasActivePlayer;

playerName = ""
