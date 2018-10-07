/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

xspd = 0;
yspd = 0;

fixture = physics_fixture_create();
physics_fixture_set_collision_group(fixture,1);