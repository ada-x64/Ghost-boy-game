/// @description global variables
if (keyboard_check_released(ord("R"))) {room_restart();}
if (keyboard_check_pressed(vk_space)) {global.enable_debug = !global.enable_debug;}