/// @description create child portrait

portraitObjId = instance_create_depth(x + 10, y + 10, -100, o_characterSelectPortrait)

with(portraitObjId) {
	//other.visible = false; // should only be visible if this panel has an active player
}

if (slot == 0) {
	image_index = 0;
} else {
	image_index = 1;	
}

hasActivePlayer = false

playerName = ""