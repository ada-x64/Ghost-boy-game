image_speed = 0;
xspd = 0;
yspd = 0;
maxspd = 4;
spd = 2;
maxmass = 10;
layer = layer_get_id("player");

arrowx = 0;
arrowy = 0;

obj = noone;
goto_player = false;

follow_timer = 0;
follow_player = false;

sliptimer = 0;

//set fixture
fix = physics_fixture_create();
physics_fixture_set_circle_shape(fix,1);
physics_fixture_bind(fix,self);

//particles
ps = part_system_create();
pt_sweat = part_type_create();
part_type_sprite(pt_sweat,spr_ghost_sweat,false,false,false);
part_type_gravity(pt_sweat,gravity,-gravity_direction);
part_type_speed(pt_sweat,1,3,0,0);
part_type_orientation(pt_sweat,-45,45,0,0,true);