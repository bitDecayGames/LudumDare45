if alarm[0] < 0 {
	alarm[0] = room_speed * 2;

	var mag = point_distance(other.x, other.y, other.x + other.phy_speed_x, other.y + other.phy_speed_y);
	var dmg = damagePotential * mag;

	other.hitpoints -= dmg;
	
	var sparkX = (x + other.x) / 2;
	var sparkY = (y + other.y) / 2;
	var sparkDepth = depth - 1;
	with(instance_create(sparkX, sparkY, obj_spark)) {
		depth = sparkDepth;	
	}
	
	debugHitX = -phy_speed_x;
	debugHitY = -phy_speed_y;
	debugHitStr = " | dlt: " + string(dmg);
}
