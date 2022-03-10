draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, random_color, 1);

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - sprite_height, "P" + string(player_index + 1));