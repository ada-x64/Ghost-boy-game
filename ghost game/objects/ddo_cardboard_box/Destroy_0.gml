var arr;

arr[0] = instance_create_layer(x,y-sprite_height/2,layer,do_cardboard_scrap);
arr[1] = instance_create_layer(x,y+sprite_height/2,layer,do_cardboard_scrap);
arr[2] = instance_create_layer(x-sprite_width/2,y,layer,do_cardboard_scrap);
with (arr[2]) {phy_angular_velocity = 10;}
arr[3] = instance_create_layer(x+sprite_width/2,y,layer,do_cardboard_scrap);
with (arr[3]) {phy_angular_velocity = -10;}