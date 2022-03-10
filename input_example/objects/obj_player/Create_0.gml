/*

	obj_player

	Once bound, this object pays attention to its assigned player and subsequent input checks.
	If bound device is removed, this object unbinds the associated player and destroys itself.

*/

randomize();
player_speed = 4;
player_index = 0;
random_color = make_color_rgb(irandom_range(100,255),irandom_range(100,255),irandom_range(100,255));