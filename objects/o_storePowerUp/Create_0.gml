/// @description set initial vars

isSelected = false

textOffsetX = sprite_width / 2.0;
textOffsetY = -30;

costOffsetX = sprite_width / 2.0;
costOffsetY = sprite_height - 10;

slot = global.store_current_slot;

global.store_selection_availability[menuIndex] = available;

event_user(1); // trigger get the current stat value