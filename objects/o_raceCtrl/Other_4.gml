/// @description Wait till after the room has been created so we have a trackPath, then instantiate cars
var path = global.trackPath;
var startX = path_get_point_x(path, 0)
var startY = path_get_point_y(path, 0)

show_debug_message("Starting players at: " + string(startX) + ", " + string(startY));
for (var i = 0; i < playerCount; ++i){
	with(instance_create(startX + irandom(10), startY + irandom(10), obj_truck)){
		slot = i;
		event_user(0); // this is basically the Init method since Create gets called before this block
	}
	
	targetY[i] = top + i * placeSpace;
	curY[i] = top + i * placeSpace;
}