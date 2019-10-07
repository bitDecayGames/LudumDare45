/// @description add fake players to the player stats

var playerCount = 8

for (var i = 0; i < playerCount; ++i) {
    sc_save_player_stats(
		i, 
		true, 
		sc_random_character_name(), 
		1000.0, 
		0.1, 
		0.1, 
		0.1, 
		0.1, 
		0.5, 
		0.1, 
		sc_pick_random_car_color(), 
		sc_pick_random_portrait(), 
		i < 1
	);
	global.player_place[i] = (playerCount - 1) - i;
}

global.store_current_slot = 0;