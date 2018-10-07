event_inherited();
fixture = physics_fixture_create();
physics_fixture_set_box_shape(fixture,width/2,height/2);
physics_fixture_set_density(fixture,0);
physics_fixture_set_collision_group(fixture,1);
physics_fixture_bind(fixture,self);