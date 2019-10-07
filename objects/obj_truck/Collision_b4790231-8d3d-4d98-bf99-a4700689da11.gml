if canBeHit {
	canBeHit = false;
	alarm[0] = room_speed * 2;

	var mag = point_distance(other.x, other.y, other.x + other.phy_speed_x, other.y + other.phy_speed_y);
	var dmg = damagePotential * mag;

	other.hitpoints -= dmg;
	
	debugHitX = -phy_speed_x;
	debugHitY = -phy_speed_y;
	debugHitStr = " | dlt: " + string(dmg);
}
