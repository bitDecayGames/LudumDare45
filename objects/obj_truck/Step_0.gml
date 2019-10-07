// Die!
if hitpoints <= 0 {
	instance_destroy();
}

debugStr = "slick: " + string(alarm[1] > 0) + debugHitStr

var turnLeft = false
var turnRight = false
var accelerate = false
var decelerate = false
var dropOilSlick = false

// Check checkpoint/lap/navigation points
var pathPointX = path_get_point_x(path, pointIdx);
var pathPointY = path_get_point_y(path, pointIdx);
debugTargetPointX = pathPointX;
debugTargetPointY = pathPointY;

var nearPathPoint = point_distance(x, y, pathPointX, pathPointY) < pointDistance;
if(nearPathPoint) {
	pointIdx++;
	
	if pointIdx >= 0 && incrLap {
		incrLap = false;
		global.player_lap[slot] = global.player_lap[slot] + 1;
	}
	
	global.player_checkpoint[slot] = global.player_checkpoint[slot] + 1;
	global.player_last_checkpoint_time[slot] = current_time;
	
	if(pointIdx >= numPoints) {
		pointIdx = 0;
		incrLap = true;
	}
}

if (isPlayer) {
	turnLeft = keyboard_check(vk_left) || gamepad_button_check(slot, gp_padl);
	turnRight = keyboard_check(vk_right) || gamepad_button_check(slot, gp_padr);
	accelerate = keyboard_check(vk_up) || gamepad_button_check(slot, gp_face1);
	decelerate = keyboard_check(vk_down) || gamepad_button_check(slot, gp_face2);
	dropOilSlick = keyboard_check(vk_space) || gamepad_button_check(slot, gp_face3);
	if (accelerate) audio_play_sound(sfx_carmotor, 100, false);
} else {
	// AI	
	// Point at objective
	var steerDir = point_direction(x, y, pathPointX, pathPointY);
	var steerRot = angle_difference(-phy_rotation, steerDir);
	
	// Steer car
	if steerRot < 0 {
		turnLeft = true;
	} else if steerRot > 0 {
		turnRight = true;
	}
	// Otherwise, drive straight!

	// Determine if we should be accelrating or decelerating
//	var distanceToPoint = point_distance(x, y, pathPointX, pathPointY);
//	var gettingClose = distanceToPoint <= pointDistance * 2;
	if abs(steerRot) > 90 {
		decelerate = true;
	}
	accelerate = !decelerate;
}

var numOils = global.player_oilslick[slot];
if dropOilSlick && alarm[2] <= 0 && numOils > 0 {
	global.player_oilslick[slot] = numOils - 1;
	alarm[2] = room_speed * 2;
	var mySlot = slot;
	with(instance_create(x, y, obj_oil)) {
		createdBy = mySlot;
	}
}

var rotation = phy_rotation;
debugFaceX = dcos(rotation);
debugFaceY = dsin(rotation);

// Turn
var turnDir = 0;
if turnLeft {
	turnDir = -turnSpeed;
} else if turnRight {
	turnDir = turnSpeed;
}
phy_angular_velocity = turnDir;

// Gotta go fast
var forceX = 0;
var forceY = 0;
var xRot = dcos(rotation);
var yRot = dsin(rotation);
var xAccel = xRot * accelerationSpeed;
var yAccel = yRot * accelerationSpeed;

// Oil
var oilSlickActive = alarm[1] > 0; 
if oilSlickActive {
	accelerate = true;
	decelerate = false;
}

if accelerate && !decelerate {
	forceX = xAccel;
	forceY = yAccel;
} else if decelerate {
	// Normalize
	var len = sqrt((phy_speed_x * phy_speed_x) + (phy_speed_y * phy_speed_y));
	var decelX = -phy_speed_x / len;
	var decelY = -phy_speed_y / len;

	forceX = decelX * accelerationSpeed;
	forceY = decelY * accelerationSpeed;
}

if forceX != 0 || forceY != 0 {
	physics_apply_force(x, y, forceX, forceY);	
}

debugForceX = forceX;
debugForceY = forceY;

// Make skids
var velDir = point_direction(x, y, x + phy_speed_x, y + phy_speed_y);
var rotDir = point_direction(x, y, x + xRot, y + yRot);
var skidRot = angle_difference(velDir, rotDir);
var gottaGoFast = abs(phy_speed_x) > minSkidSpeed || abs(phy_speed_y) > minSkidSpeed

if abs(skidRot) > 30 && gottaGoFast {
	var arrLen = array_height_2d(wheelArray);
	for (var i = 0; i < arrLen; i++) {
		var xDir = wheelArray[i, 0];
		var yDir = wheelArray[i, 1];
			
		var skidStartX = x + (xRot * xDir * 5);
		var skidStartY = y + (yRot * yDir * 5);
		
		var truckDepth = depth;
		with(instance_create(skidStartX, skidStartY, obj_skid_mark_v2)) {
			depth = truckDepth + 1;
			skidEndX = skidStartX + xAccel
			skidEndY = skidStartY + yAccel
		}	
	}
}

// Set image rotation
var modRotation = -1 * (rotation mod 360);
if modRotation < 0 {
	modRotation	+= 360;
}

// debugStr = string(modRotation) + " | " + string(rotation);

// HACKS Likely a better way to do this, but I am le tired
if modRotation > 22.5 * 1 && modRotation < 22.5 * 3 {
	image_index = 3
} else if modRotation > 22.5 * 3 && modRotation < 22.5 * 5 {
	image_index = 4
} else if modRotation > 22.5 * 5 && modRotation < 22.5 * 7 {
	image_index = 5
} else if modRotation > 22.5 * 7 && modRotation < 22.5 * 9 {
	image_index = 6
} else if modRotation > 22.5 * 9 && modRotation < 22.5 * 11 {
	image_index = 7
} else if modRotation > 22.5 * 11 && modRotation < 22.5 * 13 {
	image_index = 8
} else if modRotation > 22.5 * 13 && modRotation < 22.5 * 15 {
	image_index = 1
} else if (modRotation > 22.5 * 15 && modRotation < 22.5 * 16) || (modRotation < 22.5 * 1 && modRotation > 0) {
	image_index = 2
}
