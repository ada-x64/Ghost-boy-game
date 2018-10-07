tweak = false;
/**
menu_list = ds_list_create();
menu_tabs = ds_list_create();
/**/

t = noone;
obj_to_spawn = noone;
selection = 0;
stimer = 0;
sdir = 0;
num_objs = 0;
while (object_exists(num_objs))
{
	arr[num_objs] = object_get_name(num_objs);
	num_objs ++;
}