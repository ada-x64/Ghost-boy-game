if instance_exists(obj_in_range)
{
	gpu_set_blendmode(bm_add);
	draw_line_color(x,y,obj_in_range.x,obj_in_range.y,c_gray,c_white);
	gpu_set_blendmode(bm_normal);
}

draw_set_alpha(0.8);
draw_circle(x,y,12,false);
draw_set_alpha(1);
var xvar = 0;
var yvar = 0;
if (image_index = 2)
	{xvar = random(1); yvar = random(1);}
draw_sprite(sprite_index,image_index,x+1+xvar+3*xspd/maxspd,y+yvar+3*yspd/maxspd);