if (stimer != -1)
{
	var stime = 1.5*fps;
	stimer ++;
	if (stimer >= stime-1)
		stimer = -1;
	draw_set_alpha((stime-stimer)/stime);
	draw_text(mouse_x,mouse_y,object_get_name(selection));
	draw_set_alpha(1);
	if (string_count("do_",object_get_name(selection)) == 0 or string_count("parent",object_get_name(selection)) != 0)
		{selection ++;}
	if (selection < 0) {selection = num_objs;}
	if (selection > num_objs) {selection = 0;}
}