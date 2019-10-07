/// @description button press logic

if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_select)) {
	game_end();	
}

selectedIndex += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)


if (gamepad_button_check_pressed(0, gp_padu)) {
	selectedIndex -= 1;
} else if (gamepad_button_check_pressed(0, gp_padd)) {
	selectedIndex += 1;	
}


var vAxis = gamepad_axis_value(0, gp_axislv);
if (!gamepadStickReset) {
	if (vAxis > threshold) {
		selectedIndex += 1;
		gamepadStickReset = true;
	} else if (vAxis < -threshold) {
		selectedIndex -= 1;
		gamepadStickReset = true;
	}
} else {
	if (vAxis < threshold && vAxis > -threshold) {
		gamepadStickReset = false;
	}
}


if (selectedIndex >= menuCount) selectedIndex = 0
else if (selectedIndex < 0) selectedIndex = menuCount - 1



if keyboard_check_pressed(vk_space) || (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1)){
	audio_play_sound(sfx_select, 0, false);
	switch (selectedIndex) {
		case 0:
			room_goto(rm_PlayerSelect)
			break;
		case 1:
			room_goto(rm_Credits);
			break;
		case 2:
			game_end()
			break;
		case 3:
			room_goto(rm_RaceResults)
			break;
		case 4:
			room_goto(rm_Shop)
			break;
		case 5:
			room_goto(rm_Game)
			break;
	}
}