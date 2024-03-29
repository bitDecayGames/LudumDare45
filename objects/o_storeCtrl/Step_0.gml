/// @description check for continue

var keyboardContinue = slot == 0 && keyboard_check_pressed(vk_enter);
var gamepadContinue = gamepad_button_check_pressed(slot, gp_start);

if (!global.player_is_human[global.store_current_slot]) keyboardContinue = true; // force it to go if no human

if (keyboardContinue || gamepadContinue) {
	var playerCount = array_length_1d(global.player_name);
	var foundAnotherHuman = false;
	for (var i = slot + 1; i < playerCount; ++i) {
		if (global.player_is_human[i]) {
			foundAnotherHuman = true;
			global.store_current_slot = i;
			audio_play_sound(sfx_select, 0, false);
			room_goto(rm_Shop);
			break;
		}
	}
	if (!foundAnotherHuman){
		audio_play_sound(sfx_select, 0, false);
		room_goto(rm_Game);
	}
}

var vAxis = gamepad_axis_value(slot, gp_axislv);
var up = (slot == 0 && (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))) || gamepad_button_check_pressed(slot, gp_padu) || (!gamepadStickReset && vAxis < -threshold);
var down = (slot == 0 && (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))) || gamepad_button_check_pressed(slot, gp_padd) || (!gamepadStickReset && vAxis > threshold);

if (up) {
	global.store_current_selection_index -= 1;
	gamepadStickReset = true;
} else if (down) {
	global.store_current_selection_index += 1;	
	gamepadStickReset = true;
}

if (vAxis < threshold && vAxis > -threshold) {
	gamepadStickReset = false;
}


if (global.store_current_selection_index >= menuCount) global.store_current_selection_index = 0
else if (global.store_current_selection_index < 0) global.store_current_selection_index = menuCount - 1


if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_select)) {
	audio_play_sound(sfx_hover, 0, false);
	room_goto(rm_MainMenu);	
}