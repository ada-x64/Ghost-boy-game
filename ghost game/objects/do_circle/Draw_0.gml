//draw sprite
#region draw sprite
if (sprite_index != -1)
	draw_self();
#endregion draw sprite
if (global.enable_debug)
{
#region draw mask
if (debug_drawMask)
{
	draw_set_color(col);
	draw_set_alpha(0.8);
	draw_circle(x,y,radius,false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}
#endregion draw mask
#region draw data
if (debug_drawData)
{
	draw_arrow(x,y,x+phy_speed_x,y+phy_speed_y,16);
	draw_text(x,y-16,"spd = "+string(spd));
	draw_text(x,y-8,"dir = "+string(dir));
	for (var i = 0; i < vertices; i ++)
	{
		draw_text(vx[i],vy[i],string(i));
	}
}
draw_text(x,y,string(phy_mass));
#endregion draw data
}