//calculate instantaneous force of impact
var foi, foi_x, foi_y; //f = ma; want to find the impact of the other on the self
//how do we do that?
foi_x = other.phy_mass*other.phy_linear_velocity_x - self.phy_mass*self.phy_linear_velocity_x;
foi_y = other.phy_mass*other.phy_linear_velocity_y - self.phy_mass*self.phy_linear_velocity_y;
foi = sqrt(foi_x*foi_x + foi_y*foi_y);

if (foi > phy_mass*fragility)
{
	instance_destroy(self);
}