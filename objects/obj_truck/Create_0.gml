debug = true
debugStr = ""
debugTargetPointX = 0
debugTargetPointY = 0
debugForceX = 0
debugForceY = 0
debugFaceX = 0
debugFaceY = 0

numFrames = 8
image_index = 2

accelerationSpeed = 10
turnSpeed = 100

minSkidSpeed = 0.5

// AI stats
// https://www.reddit.com/r/gamemaker/comments/4ieosj/can_i_use_game_maker_pathfinding_and_physics_at/d2xjaa7/
path = path_carProto;
// mp_grid_path(path); // assumed path points to the goal
numPoints = path_get_number(path); // get the number of nodes of that path
pointIdx = 0; // path to the first node first... firstly.
pointDistance = 64; // Distance from a node required before targeting the next one

// Use here to swap between AI and player control
isPlayer = false

wheelArray[0, 0] = 1;
wheelArray[0, 1] = 1;

wheelArray[1, 0] = -1;
wheelArray[1, 1] = -1;

wheelArray[2, 0] = -1;
wheelArray[2, 1] = 1;

wheelArray[3, 0] = 1;
wheelArray[3, 1] = -1;