/// @description button press logic

selectedIndex += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)

if (selectedIndex >= menuCount) selectedIndex = 0
else if (selectedIndex < 0) selectedIndex = menuCount - 1
