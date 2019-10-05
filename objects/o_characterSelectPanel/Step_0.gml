/// @description check for join keypresses

if (!hasActivePlayer) {
	var becomeKeyboard = keyboard_check_pressed(vk_space) && slot == 0;
	var becomeGamepad = gamepad_button_check_pressed(slot, gp_face1);
	if (becomeKeyboard || becomeGamepad > 0) {
		
		hasActivePlayer = true;
		if (becomeKeyboard) {
			image_index = 3; // show keyboard prompts
		} else {
			image_index = 2; // show gamepad prompts
		}
		
		playerName = sc_random_character_name();
		
		with(portraitObjId) {
			//other.visible = true; // should only be visible if this panel has an active player
		}
	}
} else {
	var exitKeyboard = keyboard_check_pressed(ord("B")) && slot == 0;
	var exitGamepad = gamepad_button_check_pressed(slot, gp_face2);
	if (exitKeyboard || exitGamepad) {
		hasActivePlayer = false;
		
		if (slot == 0){
			image_index = 0;
		} else {
			image_index = 1;	
		}
		
		playerName = "";
		
		with(portraitObjId) {
			//other.visible = false; // should only be visible if this panel has an active player
		}
	}
	
	var refreshKeyboard = keyboard_check_pressed(ord("R")) && slot == 0;
	var refreshGamepad = gamepad_button_check_pressed(slot, gp_face3);
	if (refreshKeyboard || refreshGamepad) {
		// refresh the name and portrait
		playerName = sc_random_character_name();
		// TODO: get random portrait index
	}
}
