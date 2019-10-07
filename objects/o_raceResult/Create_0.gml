/// @description Create and link portait

// ///////////////////////
// CONSTANTS
portraitOffsetX = 100;
portraitOffsetY = 10;
portraitScale = 0.5;

nameOffsetX = 170;
nameOffsetY = 30;

carOffsetX = -200;
carOffsetY = 60;
carScale = 2;

flyInSpeed = 40;

baseWinnings = 100.0;
extraWiningsPerRank = 25.0;
// ///////////////////////

portraitIndex = 0;
hasBuilt = false;
racerName = "";
winnings = 0.0;

shader = shd_colorMask;
u_red_tint = shader_get_uniform(shader, "red_tint");
u_green_tint = shader_get_uniform(shader, "green_tint");
u_blue_tint = shader_get_uniform(shader, "blue_tint");
color = [];