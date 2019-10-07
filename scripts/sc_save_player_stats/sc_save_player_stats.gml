/// @param slot
/// @param active
/// @param name
/// @param money
/// @param top_speed
/// @param acceleration
/// @param turning
/// @param breaking
/// @param hitpoints
/// @param damage_potential
/// @param colors
/// @param portrait
/// @param isHuman

var slot = argument0;
var active = argument1;
var name = argument2;
var money = argument3;
var top_speed = argument4;
var acceleration = argument5;
var turning = argument6;
var breaking = argument7;
var hitpoints = argument8;
var damage_potential = argument9;
var colors = argument10;
var portrait = argument11;
var isHuman = argument12;

global.player_active[slot] = active;
global.player_name[slot] = name;
global.player_money[slot] = money;
global.player_top_speed[slot] = top_speed;
global.player_acceleration[slot] = acceleration;
global.player_turning[slot] = turning;
global.player_breaking[slot] = breaking;
global.player_hitpoints[slot] = hitpoints;
global.player_damage_potential[slot] = damage_potential;
global.player_colors[slot] = colors;
global.player_portrait[slot] = portrait;
global.player_place[slot] = 0;
global.player_is_human[slot] = isHuman;

global.player_oilslick[slot] = 0;
global.player_turbo[slot] = 0;

global.player_lap[slot] = 1;
global.player_checkpoint[slot] = 0;
global.player_last_checkpoint_time[slot] = -1