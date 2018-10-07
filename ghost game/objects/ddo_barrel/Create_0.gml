// Inherit the parent event
event_inherited();

//set vertices
/**
physics_fixture_set_circle_shape(fixture,radius);
/**
physics_set_restitution(fixture,restitution);
physics_set_density(fixture,massScalar/(pi*radius*radius));
/**
myFix = physics_fixture_bind(fixture,self);
physics_fixture_delete(fixture);
/**/