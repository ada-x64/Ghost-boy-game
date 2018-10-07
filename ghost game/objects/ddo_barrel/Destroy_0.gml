var replacement = instance_create_layer(x,y,layer,do_broken_barrel);
with (replacement)
{
	phy_linear_velocity_x = other.phy_linear_velocity_x;
	phy_linear_velocity_y = other.phy_linear_velocity_y;
}

repeat (random_range(1,3))
	instance_create_layer(x,y,layer,do_wood_scrap);