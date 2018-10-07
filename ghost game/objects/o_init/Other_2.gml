//game settings
game_set_speed(60,gamespeed_fps);
instance_create_layer(x,y,layer,C);
instance_create_layer(x,y,layer,o_cam);
instance_create_layer(x,y,layer,o_tweak);
global.enable_debug = false;

//drawing variables
vertex_format_begin()
vertex_format_add_position();
vertex_format_add_color();
vertex_format_add_texcoord();
global.vf = vertex_format_end();
global.vb = vertex_create_buffer();

//init cam
//global.cam = -1;
global.cam = camera_create_view(0,0,640,360,0,o_cam,-1,-1,320,180);
for (var i = 0; i < room_last; i ++)
{
	room_set_view_enabled(i,true);
	room_set_viewport(i,0,true,0,0,1280,720);
}

//set up window
window_set_size(1280,720);
window_set_position(-640+display_get_width()/2,-360+display_get_height()/2);
//resize gui
display_set_gui_size(1280,720);
surface_resize(application_surface,640,360);

//get out of init room!
room_goto_next();