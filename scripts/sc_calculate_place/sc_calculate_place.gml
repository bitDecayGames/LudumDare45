
var playerCount = array_length_1d(global.player_name);
var placeValues = ds_grid_create(2, playerCount);
for (var i = 0; i < playerCount; ++i){
	var lap = global.player_lap[i] * 1000.0;
	var checkpoint = global.player_checkpoint[i];
	var time = 1 / global.player_last_checkpoint_time[i];
	
	ds_grid_set(placeValues, 0, i, i);
	ds_grid_set(placeValues, 1, i, lap + checkpoint + time);
}

ds_grid_sort(placeValues, 1, false);

for (var i = 0; i < playerCount; ++i) {
	var slot = ds_grid_get(placeValues, 0, i);
	global.player_place[slot] = i;
}