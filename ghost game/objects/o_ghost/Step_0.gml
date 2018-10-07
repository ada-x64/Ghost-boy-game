//reset face
image_index = 0;
x = phy_com_x;
y = phy_com_y;
if (!instance_exists(o_player)) exit;
#region movement
if (C.bumpRightP)
	goto_player = true;
if (!goto_player and !follow_player)
{
	if (abs(C.hAxisR) > 0.1 or abs(C.vAxisR) > 0.1)
		follow_timer = 0;
		
	xspd += C.hAxisR * spd;
	yspd += C.vAxisR * spd;
}
else if (goto_player)
{
	follow_timer = 0;
	follow_player = true;
	var dir = darctan2(y-o_player.y,x-o_player.x)
	xspd -= lengthdir_x(spd,dir);
	yspd += lengthdir_y(spd,dir);
	if (point_in_circle(x,y,o_player.x,o_player.y,8) or abs(C.hAxisR) > 0.1 or abs(C.vAxisR) > 0.1)
		goto_player = false;
}
else if (follow_player)
{
	var dir = darctan2(y-o_player.y,x-o_player.x)
	if (distance_to_object(o_player) > 16)
	{
		xspd -= lengthdir_x(abs(o_player.phy_speed_x),dir);
		yspd += lengthdir_y(abs(o_player.phy_speed_y),dir);
	}
	
	if (abs(C.hAxisR) > 0.1 or abs(C.vAxisR) > 0.1)
	{
		follow_timer = 0;
		follow_player = 0;
	}
		
}
if (follow_timer >= fps*1.5)
	{follow_player = true;}
if (abs(xspd) > maxspd) {xspd = sign(xspd)*maxspd;}
if (abs(yspd) > maxspd) {yspd = sign(yspd)*maxspd;}
phy_position_x += xspd;
phy_position_y += yspd;
var fric = 0.5;
xspd -= sign(xspd)*fric;
yspd -= sign(yspd)*fric;
if (abs(xspd) < fric) {xspd = 0;}
if (abs(yspd) < fric) {yspd = 0;}
#endregion movement
#region pick things up
obj_in_range = collision_circle(x,y,24,do_parent,false,true);
if (obj_in_range != noone and obj == noone)
{
	if (C.trigRightP)
	{
		obj = obj_in_range;
		//drag with chain
		var dist = sqrt(sqr(obj.x-x)+sqr(obj.y-y));
		joint = physics_joint_revolute_create(self,obj,x,y,0,360,false,0,0,0,false);
	}
	image_index = 1;
}
if (obj != noone)
{
	image_index = 2;
	if (current_time/100 % round((maxmass-obj.phy_mass)/maxmass) == 0)
		part_particles_create(ps,x+8,y-8,pt_sweat,1);
	if (C.trigRight)
	{
		spd = 2*max((maxmass-obj.phy_mass)/maxmass,0);
		if (distance_to_object(obj) > 16)
		{
			sliptimer ++;
			image_index = 4;
		}
		else sliptimer = 0;
		
		if (sliptimer > 2*fps)
		{
			image_index = 5;
			physics_joint_delete(joint);
			spd = 2;
			obj = noone;
		}
	}
	if (mouse_check_button_released(mb_left) or C.trigRightR)
	{
		physics_joint_delete(joint);
		spd = 2;
		obj = noone;
	}
}

if (obj == noone) and (C.trigRight)
	{image_index = 3;}
#endregion pick things up

//keep the ghost in view
var vx = camera_get_view_x(global.cam);
var vy = camera_get_view_y(global.cam);
var vX = vx + camera_get_view_width(global.cam)*3/8;
var vY = vy + camera_get_view_height(global.cam)*3/8;

if (x <= vx or x >= vX or y <= vy or y >= vY)
{
	follow_timer ++;
}
else follow_timer = 0;

if (x < vx) {x = vx;}
if (x > vX) {x = vX;}
if (y < vy) {y = vy;}
if (y > vY) {y = vY;}