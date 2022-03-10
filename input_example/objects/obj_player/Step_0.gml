if (input_check("up", player_index)) y -= player_speed;
if (input_check("down", player_index)) y += player_speed;
if (input_check("left", player_index)) x -= player_speed;
if (input_check("right", player_index)) x += player_speed;

if (input_check_pressed("shoot", player_index))
{
	// High quality, AAA developer explosion goes here.
	show_debug_message("bang");
}

// If the assigned gamepad disconnects, reset their input source to be "unbound" and
// destroy the player instance. This makes them a candidate for the next detected source.
if(!input_player_connected(player_index))
{	
	input_player_source_set(INPUT_SOURCE.NONE, player_index);
	input_player_gamepad_set(INPUT_NO_GAMEPAD, player_index);
	instance_destroy();
}