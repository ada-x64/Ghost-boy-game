//draw sprite
#region draw sprite

head = spr_ragdoll_head;
limb = spr_ragdoll_limb;
torso = spr_ragdoll_torso;
var move_angle = 0;

if (phy_speed_x != 0 and !in_air)
{
	if (fps != 0)
		move_timer += 360*phy_speed_x/fps;
    move_angle = (phy_speed_x/4)*45*dsin(move_timer);
	arm_angle = -7;
}
else if (!in_air)
{
	//move_timer = approach(move_timer%360,0,360/fps);
	//move_timer -= sign(move_timer);
	//if (abs(move_timer) <= 1) move_timer = 0;
	move_timer = 0;
}
if (in_air)
{
	move_timer = approach(move_timer%360,90,15);
	move_angle = 45*dsin(move_timer);
	arm_angle = approach(arm_angle,-90,15);
}


var H = -min(2*dsin(move_timer+180),0)*(phy_speed_x/4);
var d;
var h = 2//sprite_get_height(spr_ragdoll_limb)/2;
var w = 1//sprite_get_width(spr_ragdoll_limb)/2;
d[0,0] = w-3*2;  d[0,1] = h+0*2; //leftarm
d[1,0] = w-2*2;  d[1,1] = h+5*2; //leftleg
d[2,0] = w+1*2;  d[2,1] = h+5*2; //rightleg
d[3,0] = w+2*2;  d[3,1] = h+0*2; //rightarm
var hh = 5*2;

var leftarm_angle = -xscale;
var rightarm_angle = xscale;
var aa = +.75*move_angle+arm_angle;
if (grapple != 0)
{
	aa = 90;
}

if (xscale = 1)
{
	//right
	draw_sprite_ext(limb,3,x+d[3,0],H+y+d[3,1],1,1,rightarm_angle*aa,c_white,1);
	draw_sprite_ext(limb,2,x+d[2,0],H+y+d[2,1],1,1,move_angle,c_white,1);
	//torso
	draw_sprite_ext(torso,0,x,H+y+h,1,1,0,c_white,1);
	//left
	draw_sprite_ext(limb,1,x+d[1,0],H+y+d[1,1],1,1,-move_angle,c_white,1);
	draw_sprite_ext(limb,0,x+d[0,0],H+y+d[0,1],1,1,leftarm_angle*aa,c_white,1);
	//head
	draw_sprite_ext(head,0,x,H+y-hh,1,1,0,c_white,1);
}
else
{
	draw_sprite_ext(limb,0,x+d[0,0],H+y+d[0,1],1,1,leftarm_angle*aa,c_white,1);
	draw_sprite_ext(limb,1,x+d[1,0],H+y+d[1,1],-1,1,-move_angle,c_white,1);
	draw_sprite_ext(torso,0,x,H+y+h,-1,1,0,c_white,1);
	draw_sprite_ext(limb,2,x+d[2,0],H+y+d[2,1],-1,1,+move_angle,c_white,1);
	draw_sprite_ext(limb,3,x+d[3,0],H+y+d[3,1],1,1,rightarm_angle*aa,c_white,1);
	draw_sprite_ext(head,0,x,H+y-hh,-1,1,0,c_white,1);
}



#endregion draw sprite
if (global.enable_debug)
{
	draw_set_font(fnt_debug);
	draw_text(x+32,y  ,"xscale "+string(xscale));
	draw_text(x+32,y+8,"move_angle "+string(move_angle));
	draw_text(x+32,y+16,"arm_angle "+string(arm_angle));
	draw_text(x+32,y+24,"move_timer "+string(move_timer));
	draw_text(x+32,y+32,"grapple "+string(grapple));
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
	#endregion data

	/**/
	physics_draw_debug();
	if in_air col = c_red;
	else {col = c_white;}
	draw_set_color(col);
	draw_line(x,y,x,y+sprite_height/2 + 4);
	draw_set_color(c_white);
	/**
	if (collision_line(x,y,x+sprite_width/2+4,y,o_parent,false,true)) {col = c_red;}
	else {col = c_white;}
	draw_set_color(col);
	draw_line(x,y,x+sprite_width/2+4,y);
	draw_set_color(c_white);
	if (collision_line(x,y,x-sprite_width/2-4,y,o_parent,false,true)) {col = c_red;}
	else {col = c_white;}
	draw_set_color(col);
	draw_line(x,y,x-sprite_width/2-4,y);
	draw_set_color(c_white);
	draw_text(x,y+8,crouch);

//physics_draw_debug();
/**/
}