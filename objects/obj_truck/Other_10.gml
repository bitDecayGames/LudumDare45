/// @description This is the hacky Create event

debug = false
debugStr = ""
debugHitStr = ""
debugHitX = 0
debugHitY = 0 
debugTargetPointX = 0
debugTargetPointY = 0
debugForceX = 0
debugForceY = 0
debugFaceX = 0
debugFaceY = 0

numFrames = 8
image_index = 2

//topSpeed = 5 + 5 * global.player_top_speed[slot];
accelerationSpeed = 10 + 10 * global.player_acceleration[slot];
turnSpeed = 100 + 50 * global.player_turning[slot];
damagePotential = 1 + 1 * global.player_damage_potential[slot];
hitpoints = 10 + 100 * global.player_hitpoints[slot];
maxHitpoints = hitpoints;

minSkidSpeed = 0.5

// Can be hit
alarm[0] = 0;
// Oil hit
alarm[1] = 0;
prevLinDamp = phy_linear_damping;
// Oil create
alarm[2] = 0;

// Hack for laps
incrLap = false;

// AI stats
// https://www.reddit.com/r/gamemaker/comments/4ieosj/can_i_use_game_maker_pathfinding_and_physics_at/d2xjaa7/
path = global.trackPath;
// mp_grid_path(path); // assumed path points to the goal
numPoints = path_get_number(path); // get the number of nodes of that path
pointIdx = 0; // path to the first node first... firstly.
pointDistance = 192; // Distance from a node required before targeting the next one

// Use here to swap between AI and player control
isPlayer = global.player_is_human[slot];

wheelArray[0, 0] = 1;
wheelArray[0, 1] = 1;

wheelArray[1, 0] = -1;
wheelArray[1, 1] = -1;

wheelArray[2, 0] = -1;
wheelArray[2, 1] = 1;

wheelArray[3, 0] = 1;
wheelArray[3, 1] = -1;

color = global.player_colors[slot];