x = phy_com_x;
y = phy_com_y;

for (var i = 0; i < vertices; i ++)
{
	//start in top-left corner (135deg) and move clockwise
	//this way the vertices match up to the tex coords
	vx[i] = x + dcos(phy_rotation + 135 + i*360/vertices)*width/2;
	vy[i] = y + dsin(phy_rotation + 135 + i*360/vertices)*height/2;
}