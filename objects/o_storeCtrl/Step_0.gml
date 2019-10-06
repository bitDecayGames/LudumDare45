/// @description check for continue

var keyboardContinue = slot == 0 && keyboard_check_pressed(vk_enter);
var gamepadContinue = gamepad_button_check_pressed(slot, gp_start);

if (keyboardContinue || gamepadContinue) {
	var playerCount = array_length_1d(global.player_name);
	var foundAnotherHuman = false;
	for (var i = slot + 1; i < playerCount; ++i) {
		if (global.player_is_human[i]) {
			foundAnotherHuman = true;
			global.store_current_slot = i;
			room_goto(rm_Shop);
			break;
		}
	}
	if (!foundAnotherHuman){
		room_goto(rm_Game);
	}
}



global.store_current_selection_index += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)


if (gamepad_button_check_pressed(0, gp_padu)) {
	global.store_current_selection_index -= 1;
} else if (gamepad_button_check_pressed(0, gp_padd)) {
	global.store_current_selection_index += 1;	
}


var vAxis = gamepad_axis_value(0, gp_axislv);
if (!gamepadStickReset) {
	if (vAxis > threshold) {
		global.store_current_selection_index += 1;
		gamepadStickReset = true;
	} else if (vAxis < -threshold) {
		global.store_current_selection_index -= 1;
		gamepadStickReset = true;
	}
} else {
	if (vAxis < threshold && vAxis > -threshold) {
		gamepadStickReset = false;
	}
}


if (global.store_current_selection_index >= menuCount) global.store_current_selection_index = 0
else if (global.store_current_selection_index < 0) global.store_current_selection_index = menuCount - 1


if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_select)) {
	room_goto(rm_MainMenu);	
}