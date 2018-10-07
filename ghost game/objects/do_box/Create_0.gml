/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

physics_fixture_set_box_shape(fixture,width/2,height/2);
fixture = physics_fixture_bind(fixture,self);
physics_set_density(fixture,massScalar/(width*height));
physics_set_restitution(fixture,restitution);