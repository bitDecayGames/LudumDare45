if alarm[1] <= 0 {
	alarm[1] = room_speed * 5
	prevLinDamp = phy_linear_damping;
	phy_linear_damping *= 0.6;
}