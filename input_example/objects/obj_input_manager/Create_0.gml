/*
	
	obj_input_manager
	
	If you haven't already, watch the video I made on this library:
	
	
	This is an example project to demonstrate a simple local multiplayer
	"drop-in drop-out" system using Input. As I mention in the video, you could design
	this any way you want, and is entirely contingent the genre and assignment availability
	in your game. In other words, this is just an example and not production-ready code.
	
	This object is only created once at the beginning of your game and exists during
	the entire runtime.
	
	The crux of gamepad handling is input_source_detect_any(). When a new gamepad is detected
	(only after a button is pressed), a new player is instantiated. If the usb device is removed,
	the player is removed.
	
	BINDING:
	
	Once you understand how this cycle works (detect, instantiate/assign, disconnect, unbind/destroy),
	you will be well-equipped to modify it to your needs. For example, instead of "immediately"
	creating a player, you might want to dump detected devices into an array of "detected but unbound" sources.
	If you happen to be at a particular menu, and one of those controllers press the start button,
	"then" it would be assigned. This is a much more structured approach and reflects how
	some existing games handle peripheral assignment.
	
	UNBINDING:
	
	One issue with this example is how to handle "unbinding". Unplugging the device to get rid of players
	is a bit rudimentary, but it demonstrates the clean up process for player bindings. This is handled in
	the step event for obj_player.
	You might want to have a dedicated button for this. Also, research other co-op games and see what happens
	when you remove a controller. You might want to pause/alert to ask players to plug the controller in again.

*/

// Verb Bindings

// Keyboard
input_default_key(ord("W"), "up");
input_default_key(ord("S"), "down");
input_default_key(ord("A"), "left");
input_default_key(ord("D"), "right");
input_default_key(ord("J"), "shoot");

// Gamepad
input_default_gamepad_button(gp_padu, "up");
input_default_gamepad_button(gp_padd, "down");
input_default_gamepad_button(gp_padl, "left");
input_default_gamepad_button(gp_padr, "right");
input_default_gamepad_button(gp_face1, "shoot");

// Debug Stuff
debug_message = "";
message_alpha = 0;
show_debug_overlay(true);