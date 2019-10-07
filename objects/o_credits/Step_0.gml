/// @description continue

if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_select) || gamepad_button_check_pressed(0, gp_start)) {
	audio_play_sound(sfx_hover, 0, false);
	room_goto(rm_MainMenu);
}
