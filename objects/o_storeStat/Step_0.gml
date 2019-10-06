/// @description check if selected

isSelected = menuIndex == global.store_current_selection_index;


var keyboardSelect = slot == 0 && keyboard_check_pressed(vk_space);
var gamepadSelect = gamepad_button_check_pressed(slot, gp_face1);

if (isSelected && available && (keyboardSelect || gamepadSelect)) {
	
	var cost = sc_get_current_store_item_cost(baseCost, ratePerLevel, currentStatValue, maxStatValue);
	var money = global.player_money[slot];
	if (cost < money) {
		money -= cost;
		global.player_money[slot] = money;
		
		currentStatValue += 1.0 / totalPills;
		if (currentStatValue > maxStatValue) {
			currentStatValue = maxStatValue;
			available = false;
		}
		
		event_user(0); // trigger saving the stat
	}
}

global.store_selection_availability[menuIndex] = available;