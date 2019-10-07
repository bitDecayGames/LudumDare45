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
		
		var portraitIndex = sc_pick_random_portrait();
		
		var rndColor = sc_pick_random_car_color();
		color = rndColor;
		
		sc_save_player_stats(
			slot, 
			hasActivePlayer, 
			playerName, 
			0.0, 
			0.1, 
			0.1, 
			0.1, 
			0.1, 
			0.1, 
			0.1, 
			rndColor, 
			portraitIndex,
			true
		);
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
		
		global.player_active[slot] = hasActivePlayer;
	}
	
	var refreshKeyboard = keyboard_check_pressed(ord("R")) && slot == 0;
	var refreshGamepad = gamepad_button_check_pressed(slot, gp_face4);
	if (refreshKeyboard || refreshGamepad) {
		// refresh the name and portrait
		playerName = sc_random_character_name();
		
		// get random portrait index
		global.player_portrait[slot] = sc_pick_random_portrait();
		
		var rndColor = sc_pick_random_car_color();
		color = rndColor;
		global.player_colors[slot] = rndColor;
	}
}
