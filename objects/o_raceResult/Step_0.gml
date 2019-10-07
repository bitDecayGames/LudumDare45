/// @description slide in and keep child objects linked

var place = global.player_place[slot];

if (hasInit){
	if (!hasBuilt) {
		// set the portrait.image_index to the correct player portrait
		portraitIndex = global.player_portrait[slot] * 3; // happy face
		
		if (place <= 2) {
			image_index = place;	
		} else {
			image_index = 3;		
			portraitIndex += 1; // set to sad face
		}
		
		winnings = baseWinnings + extraWiningsPerRank * (10 - place)
		global.player_money[slot] += winnings;

		hasBuilt = true;
		
		racerName = global.player_name[slot];
		
		color = global.player_colors[slot];
	} else {
		if (x > targetX) x -= flyInSpeed;
	}
}


if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_select)) {
	room_goto(rm_MainMenu);	
}