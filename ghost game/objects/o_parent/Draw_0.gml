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
	vertex_begin(vb,vf);
	for (var i = 0; i < vertices - 1; i ++)
	{
		vertex_position(vb,vx[0],vy[0]);
		vertex_color(vb,col,0.5);
		vertex_texcoord(vb,0,0);
	
		vertex_position(vb,vx[i],vy[i]);
		vertex_color(vb,col,0.5);
		vertex_texcoord(vb,0,0);
	
		vertex_position(vb,vx[i+1],vy[i+1]);
		vertex_color(vb,col,0.5);
		vertex_texcoord(vb,0,0);
	}
	vertex_end(vb);
	vertex_submit(vb,pr_trianglelist,-1);
	//physics_draw_debug();
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
draw_text(x,y,string(phy_mass));
draw_text(x,y+8,string(physics_get_density(fixture)));
}
#endregion draw data
}
//physics_draw_debug();