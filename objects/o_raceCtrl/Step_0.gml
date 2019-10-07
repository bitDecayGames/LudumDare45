/// @description calculate place

sc_calculate_place();

for (var i = 0; i < playerCount; ++i){
	
	var place = global.player_place[i];
	var tar = place * placeSpace;
	targetY[i] = tar;
	var cur = curY[i];
	if (cur > tar) {
		cur -= changeSpeed;
	} else if (cur < tar) {
		cur += changeSpeed;	
	}
	curY[i] = cur;
}

if (keyboard_check_pressed(vk_escape)){
	audio_play_sound(sfx_victory, 100, false);
	room_goto(rm_MainMenu);
}
// End race
var numLaps = 3;
for (var i = 0; i < playerCount; ++i) {
	var lap = global.player_lap[i];
	if lap >= numLaps + 1 {
		global.store_current_slot = 0;
		room_goto(rm_RaceResults);
	}
}