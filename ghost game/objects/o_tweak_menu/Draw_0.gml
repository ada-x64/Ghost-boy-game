draw_set_font(fnt_menu);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
//tab
var tw = sprite_get_width(spr_menu_tabs) - 1;
var th = sprite_get_height(spr_menu_tabs);
//body
var mh = sprite_get_height(spr_menu_body);
var m_yscale = 8;
//alpha
var a = .75;
if (collision_rectangle(x,y-th,x+sprite_get_width(spr_menu_body),x+mh*(m_yscale+2),o_tweak,false,true))
	a = 1;
draw_set_alpha(a);


//name
draw_text(x,y-th,object_get_name(follow_obj));

//x
if (collision_rectangle(x+sprite_get_width(spr_menu_body)-8,y,x+sprite_get_width(spr_menu_body)-2,y+8,o_tweak,false,true))
{
	window_set_cursor(cr_handpoint);
	if mouse_check_button_pressed(mb_left)
	{
		instance_destroy(self);
	}
}

//body
draw_sprite(spr_menu_body,0,x,y);
draw_sprite_ext(spr_menu_body,1,x,y+mh,1,m_yscale,0,c_white,a);

var list;
switch(tab_selected)
{
	case 0: {list = menu0; break;}
	case 1: {list = menu1; break;}
	case 2: {list = menu2; break;}
}

for (var i = 0; i < ds_list_size(list); i ++)
{
	var str = ds_list_find_value(list,i);
	draw_text(x+6,y+mh+11*i,str);
}

draw_sprite(spr_menu_body,2,x,y+mh*(m_yscale+1));

//tabs
for (var i = 0; i < num_tabs; i ++)
{
	var str = "";
	switch (i)
	{
		case 0: {str = tab0; break;}
		case 1: {str = tab1; break;}
		case 2: {str = tab2; break;}
	}
	
	var img = 2;
	if (tab_selected == i) img = 0;
	else if (collision_rectangle(x+i*tw,y,x+(i+1)*tw,y-th,o_tweak,false,true))
	{
		img = 1;
		window_set_cursor(cr_handpoint);
		if (mouse_check_button_pressed(mb_left))
			tab_selected = i;
	}
		
	draw_sprite(spr_menu_tabs,img,x+i*tw,y);
	draw_text(x+2+i*tw,y,str);
}