x = follow_obj.x + xdist;
y = follow_obj.y + ydist;

for (var i = 0; i < instance_number(o_tweak_menu); i ++)
{
	var oth = instance_find(o_tweak_menu,i);
	if (oth != self and oth.follow_obj == self.follow_obj)
	{
		instance_destroy(self);
	}
}