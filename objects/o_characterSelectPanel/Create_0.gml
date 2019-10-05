/// @description create child portrait


portraitObjId = instance_create_depth(x + 10, y + 10, -100, o_characterSelectPortrait)

with(portraitObjId) {
	other.visible = false; // should only be visible if this panel has an active player
}

hasActivePlayer = false

