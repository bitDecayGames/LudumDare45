/// @description main menu logic

menuX = x
menuY = y

buttonHeight = 32

button[0] = "Join Tournament"
button[1] = "Quit"
button[2] = "Test Race Results"
button[3] = "Test Shop"
button[4] = "Test Race Spawn"

menuCount = array_length_1d(button)

selectedIndex = 0
gamepadStickReset = false

threshold = 0.2