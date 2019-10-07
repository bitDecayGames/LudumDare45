/// @description track input


/// @description check if selected

isSelected = menuIndex == global.store_current_selection_index;


var keyboardSelect = slot == 0 && keyboard_check_pressed(vk_space);
var gamepadSelect = gamepad_button_check_pressed(slot, gp_face1);

if (isSelected && available && (keyboardSelect || gamepadSelect)) {
	
	var cost = baseCost;
	var money = global.player_money[slot];
	if (cost <= money) {
		money -= cost;
		curCount += 1;
		global.player_money[slot] = money;
		
		event_user(0); // trigger saving the stat
	}
}
if (curCount >= maxCount) {
	available = false;	
}
global.store_selection_availability[menuIndex] = available;