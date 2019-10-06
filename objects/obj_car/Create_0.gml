debug = true

friction_strength = 6
acceleration_speed = 0.05
center_to_front = 40

richting = 0

turnLeft = false
turnRight = false
accelerate = false
decelerate = false

// AI stats
// https://www.reddit.com/r/gamemaker/comments/4ieosj/can_i_use_game_maker_pathfinding_and_physics_at/d2xjaa7/
path = path_carProto;
// mp_grid_path(path); // assumed path points to the goal
numPoints = path_get_number(path); // get the number of nodes of that path
pointIdx = 0;// path to the first node first... firstly.
pointDistance = 200; // Distance from a node required before targeting the next one
done = 0;

// Use here to swap between AI and player control
isPlayer = false
if (isPlayer) {
	turnLeft = keyboard_check(vk_left)
	turnRight = keyboard_check(vk_right)
} else {
	// TODO are the above needed for AI? Seems weird to check in Create ...
}

if not turnLeft {
    if richting > 0 {richting -= 3}} 
    
if not turnRight {
    if richting < 0 {richting += 3}} 
    
if not turnLeft and not turnRight {
    if abs(richting) < 3 {richting = 0}}
    
Vvoorx = 0
Xvoor = x+lengthdir_x(center_to_front,-phy_rotation)
Xvooroud = Xvoor
Vvoory = 0
Yvoor = y+lengthdir_y(center_to_front,-phy_rotation)
Yvooroud = Yvoor
Lvoor = 0
Dvoor = 0
Vvoorh = 0

Vachterx = 0
Xachter = x+lengthdir_x(-center_to_front,-phy_rotation)
Xachteroud = Xachter
Vachtery = 0
Yachter = y+lengthdir_y(-center_to_front,-phy_rotation)
Yachteroud = Yachter
Lachter = 0
Dachter = 0
Vachterh = 0

Vvoorx = Xvoor - Xvooroud
Xvooroud = Xvoor

Vvoory = Yvoor - Yvooroud
Yvooroud = Yvoor

Vachterx = Xachter - Xachteroud
Xachteroud = Xachter

Vachtery = Yachter - Yachteroud
Yachteroud = Yachter

previd[1] = 0
previd[2] = 0
previd[3] = 0
previd[4] = 0

