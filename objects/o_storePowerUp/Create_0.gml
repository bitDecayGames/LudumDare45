/// @description set initial vars

isSelected = false

textOffsetX = 0;
textOffsetY = -sprite_height / 2.0 - 50;

costOffsetX = 0;
costOffsetY = sprite_height / 2.0 + 30;

slot = global.store_current_slot;

global.store_selection_availability[menuIndex] = available;

event_user(1); // trigger get the current stat value