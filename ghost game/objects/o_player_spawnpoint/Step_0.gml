if (!instance_exists(o_player))
{
	var time = 1.75*fps;
	timer++;
	if (timer > time)
	{
		instance_create_layer(x,y,layer,o_player);
		timer = 0;
	}
}