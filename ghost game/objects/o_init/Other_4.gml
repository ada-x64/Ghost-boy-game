//physics
physics_world_update_speed(60);

//layers
if (!layer_exists(layer_get_id("player")))
	layer_create(-100,"player");