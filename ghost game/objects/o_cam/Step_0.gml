if (instance_exists(o_player) and instance_exists(o_ghost))
{
	dir = darctan2(o_player.y-o_ghost.y,o_player.x-o_ghost.x);
	w = camera_get_view_width(global.cam);
	h = camera_get_view_height(global.cam);
	s = 3/8; //scalar
	len_x = sign(o_ghost.x-o_player.x)*min(max(abs(o_ghost.x-o_player.x)-w*s/2,0),w*s);
	len_y = sign(o_ghost.y-o_player.y)*min(max(abs(o_ghost.y-o_player.y)-h*s/2,0),h*s);

	x = o_player.x + len_x;
	y = o_player.y + len_y;

	with (o_ghost)
	{
		if (abs(x) > abs(other.x + other.w*other.s))
			{x = other.x+other.w*other.s;}
		if (abs(y) > abs(other.y + other.h*other.s))
			{y = other.y+other.h*other.s;}
	}
}