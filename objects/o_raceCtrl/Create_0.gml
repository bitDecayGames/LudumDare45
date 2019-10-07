/// @description create players based on whoever joined

var playerCount = array_length_1d(global.player_name);

for (var i = 0; i < playerCount; ++i){
	with(instance_create(x + irandom(10), y + irandom(10), obj_truck)){
		slot = i;
		event_user(0); // this is basically the Init method since Create gets called before this block
	}
}
