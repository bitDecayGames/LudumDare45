/// @description check for continue

var keyboardContinue = keyboard_check_pressed(vk_enter);
var gamepadContinue = gamepad_button_check_pressed(0, gp_start);

if (keyboardContinue || gamepadContinue) {
	audio_play_sound(sfx_select, 0, false);
	room_goto(rm_Shop);
}




if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_select)) {
	audio_play_sound(sfx_hover, 0, false);
	room_goto(rm_MainMenu);	
}