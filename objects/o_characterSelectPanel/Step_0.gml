/// @description check for join keypresses


if (!hasActivePlayer && keyboard_check_pressed(vk_space) > 0) {
	hasActivePlayer = true;
	sprite_index = 1;
	with(portraitObjId) {
		other.visible = true; // should only be visible if this panel has an active player
	}
}
