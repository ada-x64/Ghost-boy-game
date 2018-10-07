x = mouse_x;
y = mouse_y;

window_set_cursor(cr_default);
if mouse_wheel_down() {selection--; stimer = 0;}
if mouse_wheel_up() {selection++; stimer = 0;}

if mouse_check_button_released(mb_left)
	instance_create_layer(x,y,"instances",selection);

//pick things up
if (instance_exists(instance_place(x,y,do_parent)))
{
	window_set_cursor(cr_handpoint);
	if (mouse_check_button_released(mb_right))
		instance_destroy(instance_place(x,y,do_parent));
	obj_in_range = collision_circle(x,y,8,do_parent,false,true);
	if (obj_in_range != noone and !instance_exists(o_tweak_joint))
	{
		if (mouse_check_button_pressed(mb_left))
		{
			t = instance_create_layer(x,y,layer,o_tweak_joint);
			with t
			{
				obj = obj_in_range;
				//drag with chain
				var dist = sqrt(sqr(obj.x-x)+sqr(obj.y-y));
				joint = physics_joint_revolute_create(self,obj,x,y,0,360,false,0,0,0,false);
			}
		}
	}
	if (instance_exists(t))
	{
		if (mouse_check_button_released(mb_left))
		{
			instance_destroy(t);
			t = noone;
		}
	}
}

/**
if (place_meeting(x,y,do_parent) or place_meeting(x,y,o_player))
{
	window_set_cursor(cr_handpoint);
	if (mouse_check_button_released(mb_right))
	{
		var menu = instance_create_layer(x,y,"instances",o_tweak_menu);
		with (menu)
		{
			follow_obj = instance_place(x,y,do_parent);
			if (follow_obj == noone) {follow_obj = o_player;}
			//tabs
			tab0 = "phy";
			tab1 = "vars";
			num_tabs = 2;
			//lists
			/**
			//phy
			arr_phy[0,0] = "phy_active";
			arr_phy[0,1] = follow_obj.phy_active;
			arr_phy[1,0] = "phy_dynamic";
			arr_phy[1,1] = follow_obj.phy_dynamic;
			arr_phy[2,0] = "phy_mass";
			arr_phy[2,1] = follow_obj.phy_mass;
			arr_phy[3,0] = "phy_rotation";
			arr_phy[3,1] = follow_obj.phy_rotation;
			arr_phy[4,0] = "phy_linear_damping";
			arr_phy[4,1] = follow_obj.phy_linear_damping;
			arr_phy[5,0] = "phy_angular_damping";
			arr_phy[5,1] = follow_obj.phy_angular_damping;
			//vars
			arr_var[0,0] = "mass_scalar";
			arr_var[0,1] = variable_instance_get();
			/**
		}
	}
}
/**/
