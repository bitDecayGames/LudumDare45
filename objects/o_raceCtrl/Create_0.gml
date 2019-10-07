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

for (var i = 0; i < playerCount; ++i){
	with(instance_create(x + irandom(10), y + irandom(10), obj_truck)){
		slot = i;
		event_user(0); // this is basically the Init method since Create gets called before this block
	}
	
	targetY[i] = top + i * placeSpace;
	curY[i] = top + i * placeSpace;
}

shader = shd_colorMask;
u_red_tint = shader_get_uniform(shader, "red_tint");
u_green_tint = shader_get_uniform(shader, "green_tint");
u_blue_tint = shader_get_uniform(shader, "blue_tint");


