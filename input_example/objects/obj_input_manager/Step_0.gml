// First-come-first-serve System
// This always returns a struct. If no device is detected, unassigned_source.source is INPUT_SOURCE.NONE
var unassigned_source = input_source_detect_any();

if(unassigned_source.source != INPUT_SOURCE.NONE) {
	
	// Check if there is a player with an unbound source.
	for (var i = 0; i < INPUT_MAX_PLAYERS; i++) {
	
		if (input_player_source_get(i) == INPUT_SOURCE.NONE) {
		
			// If an unbound player is found, create a new player object and bind the new device to them.
			with (instance_create_layer(irandom_range(0, room_width), irandom_range(0, room_height), "Instances", obj_player)) {
			
				player_index = i;
				if(unassigned_source.source == INPUT_SOURCE.KEYBOARD_AND_MOUSE) {
					
					input_player_source_set(INPUT_SOURCE.KEYBOARD_AND_MOUSE, player_index);
					show_debug_message("Player index" + string(player_index) + " assigned to keyboard!");
					
				} else if (unassigned_source.source == INPUT_SOURCE.GAMEPAD) {
				
					input_player_source_set(INPUT_SOURCE.GAMEPAD, player_index);
					// unassigned_source.gamepad tells us the gamepad's index number.
					input_player_gamepad_set(unassigned_source.gamepad, player_index);
					show_debug_message("Player index" + string(player_index) + " assigned to gamepad " + string(unassigned_source.gamepad) + "!");
				
				}
			}
			
			break; // This is needed to prevent multiple instances of players getting bound to the same device.
			
		}
	
	}

}