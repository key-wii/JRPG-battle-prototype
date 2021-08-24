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
		else */draw_set_color(o_controller_f.UIcolor);
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

draw_sprite(sprite_index, 0, (x + (cursor_pos - 1) * space) - (string_length(string(menu[cursor_pos])) * 10), y);*/

if (selection) exit;
//Draw text box
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_set_font(fnt_menu_f);
draw_set_color(o_controller_f.UIcolor);

draw_9slice(box_left, box_top, box_w_, box_h_, spr_box, 0);

textHeight = string_height(fullText) + 2;

var tLen = string_length(fullText);
if (charCount < tLen + 8) {
	if (textSound mod 7 == 0 && charCount < tLen) sound_machine(snd_text);
	textSound += 1;
	charCount += .5;
}
if (variable_instance_exists(id, "text")) {
	textPart[0] = string_copy(text[0], 1, ceil(charCount));
	textLen[0] = string_length(textPart[0]);
	if (array_length(text) > 1 && charCount >= textLen[0]) {
		textPart[1] = string_copy(text[1], 1, ceil(charCount - textLen[0]));
		textLen[1] = string_length(textPart[1]);
		if (array_length(text) > 2 && charCount >= textLen[1]) {
			textPart[2] = string_copy(text[2], 1, ceil(charCount - textLen[0] - textLen[1]));
		}
	}
} else {
	text[0] = "Why the fuck is the text variable not set properly I fucking hate you gamemaker kill yourself";
	fullText = text[0];
	textPart[0] = string_copy(text[0], 1, ceil(charCount));
	textLen[0] = string_length(textPart[0]);
}
var xxx = x;
var yyy = yy + 12;
for (var i = 0; i < array_length(textPart); i++)
	draw_text(xxx, yyy + textHeight * (i + 1), textPart[i]);