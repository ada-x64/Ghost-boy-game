event_inherited();

//player vars
grapple = 0;
grapple_joint = -1;
grapple_inst = noone;
grapple_xscale = 0;
grapple_timer = 0;
//jump
jumpforce = phy_mass * 6;
jump = false;
walljump = 0;
in_air = false;
//anim
xscale = 1;
move_timer = 0;
xscale = 1;
arm_angle = -7;
//movement
max_xspd = 2;
crouch = false;

//make ghost
if (!instance_exists(o_ghost))
	instance_create_layer(x,y,"instances",o_ghost);
	
layer = layer_get_id("player");