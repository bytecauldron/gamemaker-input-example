draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(5,25,"Input v" + string(__INPUT_VERSION));
draw_text(5,50,"Player Count: " + string(input_players_connected()));

for(var i = 0; i < 4; i++) {
	
	draw_sprite_ext(spr_controls, input_player_source_get(i), 4, 100 + 25 * i, 1, 1, 0, c_white, 1);
	if(input_direction("left", "right", "up", "down", i) != undefined)
	{
		draw_sprite_ext(spr_arrow, 0, 38, 110 + 25 * i, 1, 1, input_direction("left", "right", "up", "down", i), c_white, 1);
	}
	
	draw_text(48, 100 + 25 * i,"P" + string(i+1) + "   Gamepad Index: " + string(input_player_gamepad_get(i)));
	
	var connected = input_player_connected(i) ? 0 : 1;
	draw_sprite_ext(spr_connect, connected, 74, 110 + 25 * i, 1, 1, 0, c_white, 1);
	
}

draw_set_alpha(message_alpha);
draw_text(5, 700, string(debug_message));
draw_set_alpha(1);