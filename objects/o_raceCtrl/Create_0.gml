/// @description create players based on whoever joined

// ////////////////////
// CONSTANTS
placeSpace = 90;

placePortraitOffsetX = 0;
placePortraitOfffsetY = 0;
placePortraitScale = 0.175;

textOffsetX = 60;
textOffsetY = 10;

carOffsetX = 75;
carOffsetY = 70;
carScale = 1.3;

iconOffsetX = 60;
iconOffsetY = 40;
iconSpace = 18;
iconScale = 0.15;

top = 100;
changeSpeed = 2;

playerCount = array_length_1d(global.player_name);
// ////////////////////

targetY = [];
curY = [];



shader = shd_colorMask;
u_red_tint = shader_get_uniform(shader, "red_tint");
u_green_tint = shader_get_uniform(shader, "green_tint");
u_blue_tint = shader_get_uniform(shader, "blue_tint");


