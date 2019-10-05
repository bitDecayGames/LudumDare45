/// @description main menu logic

menuX = x
menuY = y

buttonHeight = 32

button[0] = "Join Tournament"
button[1] = "Quit"

menuCount = array_length_1d(button)

selectedIndex = 0

show_debug_message("menu count: " + string(menuCount))