/// @description Draw UI buttons and cursor arrow
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_set_font(fnt_menu_f);

var xx = 0;
if (!selection) {
	for (var button = 0; button < array_length(menu); button++) {
		var pos = (button - 1) * space;
		var box_w = 240;
		var box_h = 72;
		var alpha = .4;
		if (!global.win || button == 0) draw_9slice(x + pos - (box_w / 2), y - box_h / 2, box_w, box_h, spr_box, 0);
		else draw_9slice_alpha(x + pos - (box_w / 2), y - box_h / 2, box_w, box_h, spr_box, 0, alpha);

		/*if (cursor_pos == button) draw_set_color(o_controller_f.UIselectedColor);
		else */draw_set_color(o_controller.UIcolor);
		if (!global.win || button == 0) alpha = 1;
		draw_set_alpha(alpha);
		draw_text(x + pos, y, string(menu[button]));
		draw_set_alpha(1);
	}
} else if (!instance_exists(o_menu_f_combat)) {
	var box_w = 240;
	var box_h = 72;
	xx = box_w * -2;
	draw_9slice(x - box_w + xx, y - box_h / 2, box_w + xx, box_h, spr_box, 0);

	draw_set_color(o_controller_f.UIselectedColor);
	draw_text(x + xx, y, string(menu[cursor_pos]));
}

var cursor_spr = 0;
if (!selection) draw_sprite(sprite_index, cursor_spr, (x + (cursor_pos - 1) * space) - (string_length(string(menu[cursor_pos])) * 20), y);
else if (!instance_exists(o_menu_f_combat)) {
	cursor_spr = 1;
	draw_sprite(sprite_index, cursor_spr, (xx) + x - (string_length(string(menu[cursor_pos])) * 20), y);
}

/*var button;
for (button = 0; button < array_length(menu); button++) {
	var pos = (button - 1) * space;
	var box_w = 128;
	var box_h = 64;
	draw_9slice(x + pos - (box_w / 2), y - box_h / 2, box_w, box_h, spr_box, 0);
	draw_text(x + pos, y, string(menu[button]));
}

draw_sprite(sprite_index, 0, (x + (cursor_pos - 1) * space) - (string_length(string(menu[cursor_pos])) * 10), y);