
//head
head = instance_create_depth(x,y-6,depth,do_ragdoll_limb);
with (head)
{
	sprite_index = spr_ragdoll_head;
	myFix = physics_fixture_create();
	radius = sprite_get_width(spr_ragdoll_head)/2;
	physics_fixture_set_circle_shape(myFix,radius);
	physics_fixture_set_collision_group(myFix,1);
	physics_fixture_set_angular_damping(myFix,1);
	physics_fixture_bind(myFix,self);
	physics_fixture_delete(myFix);
	physics_joint_revolute_create(self,other,x,y,0,0,true,0,0.01,true,false);
}

//limbs
d[0,0] = -3;  d[0,1] = 0; //leftarm
d[1,0] = -2;  d[1,1] = 5; //leftleg
d[2,0] = 1;  d[2,1] = 5; //rightleg
d[3,0] = 0;  d[3,1] = 2; //rightarm
for (var i = 0; i < 4; i ++)
{
	limb[i] = instance_create_depth(x+d[i,0],y+d[i,1],depth-1,do_ragdoll_limb);
	with (limb[i])
	{
		depth = other.depth-1 + i;
		if (i >= 2) {depth++;}
		sprite_index = spr_ragdoll_limb;
		image_speed = 0;
		image_index = i;
		myFix = physics_fixture_create();
		width = sprite_width/2;
		height = sprite_height/2;
		physics_fixture_set_box_shape(myFix,width,height);
		physics_fixture_bind(myFix,self);
		physics_fixture_delete(myFix);
		physics_joint_revolute_create(self,other,x,y,-90,90,true,0.01,0,true,false);
	}
}

/*
//enum limbs
enum limb {
	head,
	leftarm,
	leftleg,
	torso,
	rightleg,
	rightarm
}
//sprites
s[0] = spr_ragdoll_head;
s[1] = spr_ragdoll_leftarm;
s[2] = spr_ragdoll_leftleg;
s[3] = spr_ragdoll_torso;
s[4] = spr_ragdoll_rightleg;
s[5] = spr_ragdoll_rightarm;
//distance from center, [index,x/y]
//must be set manually. the tradeoff is this: either do this part manually (tedious but easy)
//or set the spawn locations manually (difficult)
d[0,0] = 0;  d[0,1] = -1;
d[1,0] = 3;  d[1,1] = 0;
d[2,0] = -2;  d[2,1] = 5;
d[3,0] = 0;  d[3,1] = 0;
d[4,0] = 1;  d[4,1] = 5;
d[5,0] = 0;  d[5,1] = 2;

//head - its a circle so we have to do it outside the loop
spr = spr_ragdoll_head;
//head = instance_create_depth(x,y,depth+limb.head,do_ragdoll_limb);
//head.sprite_index = spr;
//head.mask_index = spr;
//head.limb_index = 0;
fix = physics_fixture_create();
physics_fixture_set_circle_shape(fix,sprite_get_width(spr)/2);
//physics_fixture_set_collision_group(fix,1);
physics_fixture_bind_ext(fix,self,0,-100);

/*
//physics_joint_revolute_create(self,o[0],x+d[0,0],y+d[0,1],-90,90,true,0,0,false,true);

var limbfix = physics_fixture_create();
physics_fixture_set_box_shape(limbfix,2,5);
physics_fixture_set_collision_group(limbfix,1);

physics_fixture_delete(limbfix);


//limbs - all are box shapes
/*
for (var i = 1; i < 6; i ++)
{
	var w = 2;
	var h = 5;
	spr = s[i];
	o[i] = instance_create_depth(x,y,depth+i,do_ragdoll_limb);
	o[i].sprite_index = spr;
	o[i].limb_index = i;
	if (i == limb.torso)
	{
		w = 4.5;
		h = 4;
		physics_fixture_set_box_shape(limbfix,w,h);
		physics_fixture_set_collision_group(limbfix,1);
		fix[i] = physics_fixture_bind_ext(limbfix,o[i],d[i,0],d[i,1]);
		physics_joint_revolute_create(self,o[i],x+d[i,0],y+d[i,1],-0,0,true,0,0,false,false);
		
		continue;
	}
	
	spr = s[i];
	o[i] = instance_create_depth(x,y,depth+i,do_ragdoll_limb);
	o[i].sprite_index = spr;
	o[i].limb_index = i;
	physics_fixture_set_box_shape(limbfix,w,h);
	physics_fixture_set_collision_group(limbfix,1);
	fix[i] = physics_fixture_bind_ext(limbfix,o[i],d[i,0],d[i,1]);
	physics_joint_revolute_create(self,o[i],x+d[i,0],y+d[i,1],-0,0,true,0,0,false,true);
}

physics_fixture_delete(limbfix);




/*
var ox, oy;

enum limb
{
	head,
	torso,
	leftArm,
	rightArm,
	leftLeg,
	rightLeg
}
var limbPos_arr;
var numLimbs = 6;
for (var i=0; i <numLimbs; i++) 
{
	limbPos_arr[i,0] = 0;
	limbPos_arr[i,1] = 0;
}

#region fixtures
//head
ox = sprite_get_xoffset(spr_ragdoll_head);
oy = sprite_get_yoffset(spr_ragdoll_head);
limbPos_arr[limb.head,0] = x + 0;
limbPos_arr[limb.head,1] = y - 5;
head = instance_create_depth(x,y,depth,do_ragdoll_limb);
head.sprite_index = spr_ragdoll_head;
head.limb_index = limb.head;

fix_head = physics_fixture_create();
physics_fixture_set_circle_shape(fix_head,6);
physics_fixture_bind(fix_head,head);
physics_fixture_set_collision_group(fix_head,1);

//torso
ox = sprite_get_xoffset(spr_ragdoll_torso);
oy = sprite_get_yoffset(spr_ragdoll_torso);
limbPos_arr[limb.torso,0] = x + ox;
limbPos_arr[limb.torso,1] = y + oy;
torso = instance_create_depth(x,y,depth+4,do_ragdoll_limb);
torso.sprite_index = spr_ragdoll_torso;
torso.limb_index = limb.torso;

fix_torso = physics_fixture_create();
physics_fixture_set_box_shape(fix_torso,4,4.5);
physics_fixture_bind(fix_head,torso);
physics_fixture_set_collision_group(fix_torso,1);

//leftArm
ox = sprite_get_xoffset(spr_ragdoll_arm);
oy = sprite_get_yoffset(spr_ragdoll_arm);
limbPos_arr[limb.leftArm,0] = x - 8;
limbPos_arr[limb.leftArm,1] = y - 4;
leftArm = instance_create_depth(x,y,depth+1,do_ragdoll_limb);
leftArm.sprite_index = spr_ragdoll_arm;
leftArm.limb_index = limb.leftArm;

fix_leftArm = physics_fixture_create();
physics_fixture_set_box_shape(fix_leftArm,2,5);
physics_fixture_bind(fix_leftArm,leftArm);
physics_fixture_set_collision_group(fix_leftArm,1);

//rightArm
ox = sprite_get_xoffset(spr_ragdoll_arm);
oy = sprite_get_yoffset(spr_ragdoll_arm);
limbPos_arr[limb.rightArm,0] = x+8;
limbPos_arr[limb.rightArm,1] = y-4;
rightArm = instance_create_depth(x,y,depth+6,do_ragdoll_limb);
rightArm.sprite_index = spr_ragdoll_arm;
rightArm.limb_index = limb.rightArm;

fix_rightArm = physics_fixture_create();
physics_fixture_set_box_shape(fix_rightArm,2,5);
physics_fixture_bind(fix_rightArm,rightArm);
physics_fixture_set_collision_group(fix_rightArm,1);

//leftLeg
ox = sprite_get_xoffset(spr_ragdoll_leg);
oy = sprite_get_yoffset(spr_ragdoll_leg);
limbPos_arr[limb.leftLeg,0] = x-4;
limbPos_arr[limb.leftLeg,1] = y+8;
leftLeg = instance_create_depth(x,y,depth+3,do_ragdoll_limb);
leftLeg.sprite_index = spr_ragdoll_leg;
leftLeg.limb_index = limb.leftLeg;

fix_leftLeg = physics_fixture_create();
physics_fixture_set_box_shape(fix_leftLeg,2,5);
physics_fixture_bind(fix_leftLeg,leftLeg);
physics_fixture_set_collision_group(fix_leftLeg,1);

//rightLeg
ox = sprite_get_xoffset(spr_ragdoll_leg);
oy = sprite_get_yoffset(spr_ragdoll_leg);
limbPos_arr[limb.rightLeg,0] = x+ox;
limbPos_arr[limb.rightLeg,1] = y+oy;
rightLeg = instance_create_depth(x,y,depth+5,do_ragdoll_limb);
rightLeg.sprite_index = spr_ragdoll_leg;
rightLeg.limb_index = limb.rightLeg;

fix_rightLeg = physics_fixture_create();
physics_fixture_set_box_shape(fix_rightLeg,2,5);
physics_fixture_bind(fix_rightLeg,rightLeg);
physics_fixture_set_collision_group(fix_rightLeg,1);

#endregion fixtures
#region joints
physics_joint_revolute_create(self,head,limbPos_arr[limb.head,0],limbPos_arr[limb.head,1],-90,90,true,0,0,0,true);
physics_joint_revolute_create(self,torso,limbPos_arr[limb.torso,0],limbPos_arr[limb.torso,1],-90,90,false,0,0,0,true);
physics_joint_revolute_create(self,leftArm,limbPos_arr[limb.leftArm,0],limbPos_arr[limb.leftArm,1],-90,90,true,0,0,0,true);
physics_joint_revolute_create(self,rightArm,limbPos_arr[limb.rightArm,0],limbPos_arr[limb.rightArm,1],-90,90,true,0,0,0,true);
physics_joint_revolute_create(self,leftLeg,limbPos_arr[limb.leftLeg,0],limbPos_arr[limb.rightLeg,1],-90,90,true,0,0,0,true);
physics_joint_revolute_create(self,rightLeg,limbPos_arr[limb.rightLeg,0],limbPos_arr[limb.rightLeg,1],-90,90,true,0,0,0,true);
#endregion joints