tab_selected = 0;

if (!layer_exists(layer_get_id("tweak"))) {layer_create(-1000,"tweak");}
layer = layer_get_id("tweak");

if (follow_obj == noone) follow_obj = o_cam;

xdist = x - follow_obj.x;
ydist = y - follow_obj.y;

