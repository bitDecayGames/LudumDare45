Vvoorx = Xvoor - Xvooroud
Xvooroud = Xvoor

Vvoory = Yvoor - Yvooroud
Yvooroud = Yvoor

Vachterx = Xachter - Xachteroud
Xachteroud = Xachter

Vachtery = Yachter - Yachteroud
Yachteroud = Yachter

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
		var curVelX = -1 * phy_linear_velocity_x
		var curVelY = -1 * phy_linear_velocity_y
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

if accelerate {
phy_speed_x += lengthdir_x(acceleration_speed,-phy_rotation)
phy_speed_y += lengthdir_y(acceleration_speed,-phy_rotation)}

if decelerate {
phy_speed_x += lengthdir_x(-acceleration_speed/2,-phy_rotation)
phy_speed_y += lengthdir_y(-acceleration_speed/2,-phy_rotation)}

if turnLeft {
if richting < 45 {richting += 3}
if richting > 45 {richting = 45}}

if turnRight {
if richting > -45 {richting -= 3}
if richting < -45 {richting = -45}}


if not turnLeft {
    if richting > 0 {richting += angle_difference(0,richting)/3}}

if not turnRight {
    if richting < 0 {richting += angle_difference(0,richting)/3}}

if not turnLeft and not turnRight {
    if abs(richting) <= 3 {richting = 0}}
    
Xvoor = x+lengthdir_x(center_to_front,-phy_rotation)
Yvoor = y+lengthdir_y(center_to_front,-phy_rotation)

Lvoor = sqrt(sqr(Vvoorx) + sqr(Vvoory))

if abs(angle_difference(-phy_rotation + richting + 90, point_direction(0,0,Vvoorx,Vvoory))) < 90 {
Dvoor = angle_difference(-phy_rotation + richting + 90, point_direction(0,0,Vvoorx,Vvoory))}

if abs(angle_difference((-phy_rotation + richting + 90)+180, point_direction(0,0,Vvoorx,Vvoory))) < 90 {
Dvoor = angle_difference((-phy_rotation + richting + 90)+180, point_direction(0,0,Vvoorx,Vvoory))}

Vvoorh = cos((Dvoor/180)*pi)*Lvoor 

if abs(Vvoorh) > 0 {
physics_apply_force(Xvoor,Yvoor,lengthdir_x(-Vvoorh*friction_strength,point_direction(0,0,Vvoorx,Vvoory) + Dvoor),lengthdir_y(-Vvoorh*friction_strength,point_direction(0,0,Vvoorx,Vvoory) + Dvoor))

if abs(Vvoorh) > 3 {
i = instance_create(Xvoor+lengthdir_x(center_to_front/2-center_to_front/10,-phy_rotation+90),Yvoor+lengthdir_y(center_to_front/2-center_to_front/10,-phy_rotation+90),obj_skid_mark)
i.image_alpha = Vvoorh/60
i.previd = previd[1]
previd[1] = i
alarm[0] = 2
i = instance_create(Xvoor+lengthdir_x(center_to_front/2-center_to_front/10,-phy_rotation-90),Yvoor+lengthdir_y(center_to_front/2-center_to_front/10,-phy_rotation-90),obj_skid_mark)
i.image_alpha = Vvoorh/60
i.previd = previd[2]
previd[2] = i
alarm[0] = 2}
}



Xachter = x+lengthdir_x(-center_to_front,-phy_rotation)
Yachter = y+lengthdir_y(-center_to_front,-phy_rotation)

Lachter = sqrt(sqr(Vachterx) + sqr(Vachtery))

if abs(angle_difference(-phy_rotation + 90, point_direction(0,0,Vachterx,Vachtery))) < 90 {
Dachter = angle_difference(-phy_rotation + 90, point_direction(0,0,Vachterx,Vachtery))}

if abs(angle_difference((-phy_rotation + 90)+180, point_direction(0,0,Vachterx,Vachtery))) < 90 {
Dachter = angle_difference((-phy_rotation + 90)+180, point_direction(0,0,Vachterx,Vachtery))}

Vachterh = cos((Dachter/180)*pi)*Lachter 

if abs(Vachterh) > 0 {
physics_apply_force(Xachter,Yachter,lengthdir_x(-Vachterh*friction_strength,point_direction(0,0,Vachterx,Vachtery) + Dachter),lengthdir_y(-Vachterh*friction_strength,point_direction(0,0,Vachterx,Vachtery) + Dachter))

if abs(Vachterh) > 3 {
i = instance_create(Xachter+lengthdir_x(20,-phy_rotation)+lengthdir_x(center_to_front/2-center_to_front/10,-phy_rotation+90),Yachter+lengthdir_y(20,-phy_rotation)+lengthdir_y(center_to_front/2-center_to_front/10,-phy_rotation+90),obj_skid_mark)
i.image_alpha = Vachterh/60
i.previd = previd[3]
previd[3] = i
alarm[0] = 2
i = instance_create(Xachter+lengthdir_x(20,-phy_rotation)+lengthdir_x(center_to_front/2-center_to_front/10,-phy_rotation-90),Yachter+lengthdir_y(20,-phy_rotation)+lengthdir_y(center_to_front/2-center_to_front/10,-phy_rotation-90),obj_skid_mark)
i.image_alpha = Vachterh/60
i.previd = previd[4]
previd[4] = i
alarm[0] = 2}
}

