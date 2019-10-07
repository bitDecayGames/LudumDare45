/// @description main menu logic

audio_play_sound(bgm_shotguneveryround, 10, true);

randomize();

menuX = x
menuY = y

buttonHeight = 64

button = [
	"Start",
	"Credits",
	"Quit",
	"Test Race Results",
	"Test Shop",
	"Test Race Spawn",
];

menuCount = array_length_1d(button)

selectedIndex = 0
gamepadStickReset = false

threshold = 0.2