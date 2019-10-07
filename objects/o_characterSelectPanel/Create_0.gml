/// @description create child portrait

// CONSTANTS
nameOffsetX = 240;
nameOffsetY = 130;

portraitOffsetX = 200;
portraitOffsetY = -60;
portraitScaleX = 0.3;
portraitScaleY = 0.3;

carOffsetX = 240;
carOffsetY = 220;
carScale = 4.3;
// ////////////////////////

if (slot == 0) {
	image_index = 0;
} else {
	image_index = 1;	
}

hasActivePlayer = false

playerName = ""

shader = shd_colorMask;
u_red_tint = shader_get_uniform(shader, "red_tint");
u_green_tint = shader_get_uniform(shader, "green_tint");
u_blue_tint = shader_get_uniform(shader, "blue_tint");

color = [];
