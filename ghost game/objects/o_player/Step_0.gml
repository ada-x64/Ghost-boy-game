//set x and y, set vertex positions
event_inherited();

#region jump
//jump = false;
in_air = !collision_line(x,y,x,y+sprite_height/2+8,o_parent,false,true);
if (!in_air)
{
	if (!jump and C.bumpLeftP)
	{
		jump = true;
		physics_apply_impulse(phy_com_x,phy_com_y,0,-jumpforce)
	}
	walljump = 0;
}
else //walljump
{
	if collision_line(x,y,x+sprite_width/2+4,y,o_parent,false,true) and walljump != 1
	{
		xscale = -1;
		if in_air and !jump
			phy_linear_velocity_y *= 0.9;
		if (C.bumpLeftP)
		{
			jump = true;
			walljump = 1
			phy_linear_velocity_y = 0;
			phy_linear_velocity_x = 0;
			physics_apply_impulse(phy_com_x,phy_com_y,-jumpforce, -jumpforce*0.75);
		}
	}
	if collision_line(x,y,x-sprite_width/2-4,y,o_parent,false,true) and walljump != -1
	{
		xscale = 1;
		if in_air and !jump
			//phy_linear_velocity_y *= 0.9;
		if (C.bumpLeftP)
		{
			jump = true;
			walljump = -1;
			phy_linear_velocity_y = 0;
			phy_linear_velocity_x = 0;
			physics_apply_impulse(phy_com_x,phy_com_y,jumpforce, -jumpforce*0.75);
		}
	}
	
}

if jump and phy_linear_velocity_y < 0
	jump = false;
#endregion jump
#region crouch
/**
if (C.padDownP)
{
	crouch = !crouch;
	if (crouch)
	{
		physics_fixture_delete(ftemp_stand);
		physics_fixture_delete(ftemp_crouch);
		physics_fixture_set_sensor(fix_stand,true);
		physics_fixture_set_sensor(fix_crouch,false);
		//ftemp_stand = physics_fixture_bind(fix_stand,self);
		ftemp_crouch = physics_fixture_bind(fix_crouch,self);
	}
	else
	{
		physics_fixture_set_sensor(fix_stand,false);
		physics_fixture_set_sensor(fix_crouch,true);
	}
}
/**/
#endregion crouch
#region horizontal movement
if (!in_air)
{
if (C.trigLeft)
	max_xspd = 4;
else max_xspd = 2;
}
var xval = 1/8;
if (in_air) xval = 3/32;
if (C.padLeft)
{
	xspd = -xval;
	xscale = -1;
}
if (C.padRight)
{
	xspd = xval;
	xscale = 1;
}
if (!C.padLeft and !C.padRight)
{
	xspd = 0;
	phy_speed_x -= sign(phy_speed_x)*xval;
	if (abs(phy_speed_x) <= xval)
		{phy_speed_x = 0;}
}
if (abs(phy_speed_x) > 4)
	{phy_speed_x = sign(phy_speed_x)*4;}
if (abs(phy_speed_x) > 2 and max_xspd = 2)
	{phy_speed_x -= sign(phy_speed_x)*xval;}

phy_speed_x += xspd;
	/**
if (abs(phy_linear_velocity_x) <= xval)
	{phy_linear_velocity_x = 0;}
	/**/
#endregion horiz
#region grapple
if (grapple != 2)
{
	grapple = 0;
	var d = xscale*(width/2+1);
	if (collision_line(x,y,x+d,y,do_parent,false,true))
	{
		grapple = sign(d);
		if (C.trigLeftP and grapple_joint == -1)
		{
			grapple = 2;
			grapple_joint = physics_joint_revolute_create(self,instance_place(x+d,y,do_parent),x+d,y,0,0,false,0,0,false,true);
			grapple_inst = instance_place(x+d,y,do_parent);
			grapple_xscale = xscale;
		}
	}
}
else
{
	if (in_air)
	{
		grapple_timer ++;
	}
	else {grapple_timer = 0;}
	xscale = grapple_xscale;
	if (C.trigLeftR and grapple_joint != -1) or (distance_to_object(grapple_inst) > 16) or (grapple_timer > fps)
	{
		physics_joint_delete(grapple_joint);
		grapple_joint = -1;
		grapple_inst = noone;
		grapple = 0;
		grapple_timer = 0;
	}
}

#endregion grapple

phy_rotation = 0;

//outside room
if (y > room_height)
{
	//instance_destroy(self);
}