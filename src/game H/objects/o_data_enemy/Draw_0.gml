	 if (ds_list_size(sprites) == 2) var xx = 2.5;
else if (ds_list_size(sprites) == 3) var xx = 4;
else								 var xx = 1;

for (var i = 0; i < ds_list_size(sprites); i++) {
	var spr = sprites[| i];
	var w = sprite_get_width(spr);
	var h = sprite_get_height(spr);
	var spr_win = sprites_win[| i];
	if (!dead[| i]) draw_sprite_stretched(sprites[| i], sprite_index,
		(x - w / 2) + w * (ds_list_size(sprites) - xx + i), y - h - wiggle_h,
		w, h + wiggle_h);
	else draw_sprite(spr_win, sprite_index,
		x + sprite_get_width(spr_win) * (ds_list_size(sprites) - xx + i), y);
}

//draw_line(room_width / 2, 0, room_width / 2, room_height);





/*	 if (ds_list_size(sprites) == 2) var xx = 2.5;
else if (ds_list_size(sprites) == 3) var xx = 4;
else								 var xx = 1;

for (var i = 0; i < ds_list_size(sprites); i++) {
	if (!dead[| i]) draw_sprite(sprites[| i], sprite_index, x + sprite_get_width(sprites[| i]) * (ds_list_size(sprites) - xx + i), y);
	else draw_sprite(sprites_win[| i], sprite_index,
		x + sprite_get_width(sprites[| i]) * (ds_list_size(sprites) - xx + i), y);
}

//draw_line(room_width / 2, 0, room_width / 2, room_height);