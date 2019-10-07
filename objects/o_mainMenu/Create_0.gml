/// @description main menu logic

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