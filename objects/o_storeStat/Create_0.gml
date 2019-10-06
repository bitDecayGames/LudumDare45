/// @description set up stats

isSelected = false

pillSpacing = 50;

textOffsetX = 10;
textOffsetY = -30;

costOffsetX = 90;
costOffsetY = 30;

slot = global.store_current_slot;

global.store_selection_availability[menuIndex] = available;

event_user(1); // trigger get the current stat value