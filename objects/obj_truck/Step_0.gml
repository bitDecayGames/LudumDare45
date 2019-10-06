if (isPlayer) {
	turnLeft = keyboard_check(vk_left)
	turnRight = keyboard_check(vk_right)
	accelerate = keyboard_check(vk_up)
	decelerate = keyboard_check(vk_down)
} else {
	// AI
	turnLeft = false
	turnRight = false
	accelerate = false
	decelerate = false
	
	if(!done) {
		var pathPointX = path_get_point_x(path, pointIdx)
		var pathPointY = path_get_point_y(path, pointIdx)
		
		debugTargetPointX = pathPointX;
		debugTargetPointY = pathPointY;

		// Reynolds seek steering
		// http://www.red3d.com/cwr/steer/gdc99/
		var desiredVelX = x - pathPointX
		var desiredVelY = y - pathPointY

		// Normalize
		var len = sqrt((desiredVelX * desiredVelX) + (desiredVelY * desiredVelY));
		desiredVelX /= len;
		desiredVelY /= len;
		// TODO May need to add max speed to this
		
		// Flip physics values to screen values
		var curVelX = -phy_linear_velocity_x
		var curVelY = -phy_linear_velocity_y
		// Normalize
		var len = sqrt((curVelX * curVelX) + (curVelY * curVelY));
		curVelX /= len;
		curVelY /= len;
		
		var seekVelX = desiredVelX - curVelX;
		var seekVelY = desiredVelY - curVelY;
		
		debugStr = string(seekVelX) + ", " + string(seekVelY);
		
		// Steer car
		// TODO Figure out quad1 & 3
		var quad1 = seekVelX < 0 && seekVelY < 0;
		var quad2 = seekVelX > 0 && seekVelY < 0;
		var quad3 = seekVelX > 0 && seekVelY > 0;
		var quad4 = seekVelX < 0 && seekVelY > 0;
		if quad2 {
			turnRight = true;
		} else if quad4 {
			turnLeft = true;
		}
		// Otherwise, drive straight!
		// For now, always accelerate
		accelerate = true

		var nearPathPoint = point_distance(x, y, pathPointX, pathPointY) < pointDistance; /* Change this if necessary */
		if(nearPathPoint) {
	        pointIdx++;
	        if(pointIdx >= numPoints) {
	            done = true;
	       }
	    }
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

// Move
if accelerate {
	var xAccel = dcos(rotation) * accelerationSpeed;
	var yAccel = dsin(rotation) * accelerationSpeed;
	physics_apply_force(x, y, xAccel, yAccel)
	
	debugAccelX = xAccel;
	debugAccelY = yAccel;
	
	// Make skids
	if phy_speed_x > minSkidSpeed || phy_speed_y > minSkidSpeed {
		with(instance_create(x, y, obj_skid_mark_v2)) {
			skidEndX = x + xAccel
			skidEndY = y + yAccel
		}
	}
}

// Set image rotation
var modRotation = -1 * (rotation mod 360);
if modRotation < 0 {
	modRotation	+= 360;
}

debugStr = string(modRotation) + " | " + string(rotation);

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