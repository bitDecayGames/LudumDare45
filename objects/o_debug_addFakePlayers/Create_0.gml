/// @description add fake players to the player stats

var playerCount = 8

for (var i = 0; i < playerCount; ++i) {
	var rnd = irandom(10) / 100.0;
    sc_save_player_stats(
		i, 
		true, 
		sc_random_character_name(), 
		0.0, 
		0.1 + rnd, 
		0.1 + rnd, 
		0.1 + rnd, 
		0.1 + rnd, 
		0.5, 
		0.1 + rnd, 
		sc_pick_random_car_color(), 
		sc_pick_random_portrait(), 
		false
	);
	global.player_place[i] = (playerCount - 1) - i;
}

global.store_current_slot = 0;