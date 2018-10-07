/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

scrap_timer ++;
if (scrap_timer > fps*2)
{
	instance_destroy(self);
	effect_create_above(ef_smokeup,x,y,sprite_width,c_gray);
}