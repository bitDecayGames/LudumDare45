/// @description button press logic

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



if (keyboard_check_pressed(vk_enter) > 0 || gamepad_button_check_pressed(0, gp_face1)){
	switch (selectedIndex) {
		case 0:
			room_goto(rm_PlayerSelect)
			break;
		case 1:
			game_end()
			break;
	}
}