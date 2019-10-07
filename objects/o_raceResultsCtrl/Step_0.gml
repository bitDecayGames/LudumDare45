/// @description check for continue

var keyboardContinue = keyboard_check_pressed(vk_enter);
var gamepadContinue = gamepad_button_check_pressed(0, gp_start);

if (keyboardContinue || gamepadContinue) {
	room_goto(rm_Shop);
}