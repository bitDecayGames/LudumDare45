/// @description check for join keypresses

if (!hasActivePlayer) {
	var becomeKeyboard = keyboard_check_pressed(vk_space) && slot == 0;
	var becomeGamepad = gamepad_button_check_pressed(slot, gp_face1);
	if (becomeKeyboard || becomeGamepad > 0) {
		
		hasActivePlayer = true;
		portraitObjId.visible = hasActivePlayer;
		carObjId.visible = hasActivePlayer;
		if (becomeKeyboard) {
			image_index = 3; // show keyboard prompts
		} else {
			image_index = 2; // show gamepad prompts
		}
		
		playerName = sc_random_character_name();
		
		var portraitIndex = sc_pick_random_portrait();
		portraitObjId.image_index = portraitIndex;
		
		var rndColor = sc_pick_random_car_color();
		carObjId.color1_r = rndColor[0];
		carObjId.color1_g = rndColor[1];
		carObjId.color1_b = rndColor[2];
		carObjId.color2_r = rndColor[3];
		carObjId.color2_g = rndColor[4];
		carObjId.color2_b = rndColor[5];
		carObjId.color3_r = rndColor[6];
		carObjId.color3_g = rndColor[7];
		carObjId.color3_b = rndColor[8];
		
		sc_save_player_stats(
			slot, 
			hasActivePlayer, 
			playerName, 
			0.0, 
			0.0, 
			0.0, 
			0.0, 
			0.0, 
			100.0, 
			10.0, 
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
		portraitObjId.visible = hasActivePlayer;
		carObjId.visible = hasActivePlayer;
		
		if (slot == 0){
			image_index = 0;
		} else {
			image_index = 1;	
		}
		
		playerName = "";
		
		global.player_active[slot] = hasActivePlayer;
	}
	
	var refreshKeyboard = keyboard_check_pressed(ord("R")) && slot == 0;
	var refreshGamepad = gamepad_button_check_pressed(slot, gp_face3);
	if (refreshKeyboard || refreshGamepad) {
		// refresh the name and portrait
		playerName = sc_random_character_name();
		
		// get random portrait index
		var portraitIndex = sc_pick_random_portrait();
		portraitObjId.image_index = portraitIndex;
		global.player_portrait = portraitIndex;
		
		var rndColor = sc_pick_random_car_color();
		carObjId.color1_r = rndColor[0];
		carObjId.color1_g = rndColor[1];
		carObjId.color1_b = rndColor[2];
		carObjId.color2_r = rndColor[3];
		carObjId.color2_g = rndColor[4];
		carObjId.color2_b = rndColor[5];
		carObjId.color3_r = rndColor[6];
		carObjId.color3_g = rndColor[7];
		carObjId.color3_b = rndColor[8];
		global.player_colors[slot] = rndColor;
	}
}
